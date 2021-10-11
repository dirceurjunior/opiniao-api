package com.drj.opiniao.api.repository.produto;

import static com.drj.opiniao.api.model.Produto_.id;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.util.StringUtils;

import com.drj.opiniao.api.model.Produto;
import com.drj.opiniao.api.model.Produto_;
import com.drj.opiniao.api.repository.filter.ProdutoFilter;
import com.drj.opiniao.api.repository.projection.ResumoProduto;

public class ProdutosImpl implements ProdutosQuery {

	@PersistenceContext
	private EntityManager manager;

	@Override
	public Page<Produto> filtrar(ProdutoFilter produtoFilter, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Produto> criteria = builder.createQuery(Produto.class);
		Root<Produto> root = criteria.from(Produto.class);

		// criar as restrições
		Predicate[] predicates = criarRestricoes(produtoFilter, builder, root);
		criteria.where(predicates);

		TypedQuery<Produto> query = manager.createQuery(criteria);
		adicionarRestricoesDePaginacao(query, pageable);

		return new PageImpl<>(query.getResultList(), pageable, total(produtoFilter));
	}

	@Override
	public Page<ResumoProduto> resumir(ProdutoFilter produtoFilter, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<ResumoProduto> criteria = builder.createQuery(ResumoProduto.class);
		Root<Produto> root = criteria.from(Produto.class);

//		criteria.select(builder.construct(ResumoProduto.class, root.get(id), root.get(Produto_.descricao),
//				root.get(Produto_.dataVencimento), root.get(Produto_.dataPagamento), root.get(Produto_.valor),
//				root.get(Produto_.tipo), root.get(Produto_.categoria).get(Categoria_.nome),
//				root.get(Produto_.pessoa).get(Pessoa_.nome)));

		criteria.select(builder.construct(ResumoProduto.class, root.get(id), root.get(Produto_.nome),
				root.get(Produto_.categoria)));

		Predicate[] predicates = criarRestricoes(produtoFilter, builder, root);
		criteria.where(predicates);

		TypedQuery<ResumoProduto> query = manager.createQuery(criteria);
		adicionarRestricoesDePaginacao(query, pageable);

		return new PageImpl<>(query.getResultList(), pageable, total(produtoFilter));
	}

	private Long total(ProdutoFilter produtoFilter) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
		Root<Produto> root = criteria.from(Produto.class);
		// criar as restrições
		Predicate[] predicates = criarRestricoes(produtoFilter, builder, root);
		criteria.where(predicates);
		criteria.select(builder.count(root));
		return manager.createQuery(criteria).getSingleResult();
	}

	private void adicionarRestricoesDePaginacao(TypedQuery<?> query, Pageable pageable) {
		int paginaAtual = pageable.getPageNumber();
		int totalRegistrosPorPagina = pageable.getPageSize();
		int primeiroRegistroDaPagina = paginaAtual * totalRegistrosPorPagina;
		query.setFirstResult(primeiroRegistroDaPagina);
		query.setMaxResults(totalRegistrosPorPagina);
	}

	private Predicate[] criarRestricoes(ProdutoFilter produtoFilter, CriteriaBuilder builder, Root<Produto> root) {

		List<Predicate> predicates = new ArrayList<>();

		if (!StringUtils.isEmpty(produtoFilter.getNome())) {
			predicates.add(builder.like(builder.lower(root.get(Produto_.NOME)),
					"%" + produtoFilter.getNome().toLowerCase() + "%"));
		}

		if (produtoFilter.getCategoria() != null) {
			predicates.add(builder.equal(root.get(Produto_.CATEGORIA), produtoFilter.getCategoria()));
		}
		
		if (produtoFilter.getAdicional() != null) {
			predicates.add(builder.equal(root.get(Produto_.ADICIONAL), produtoFilter.getAdicional()));
		}

		return predicates.toArray(new Predicate[predicates.size()]);
	}

	@Override
	public Page<Produto> findByAdicionalTrue(ProdutoFilter produtoFilter, Pageable pageable) {
		// TODO Auto-generated method stub
		System.out.println("chegou aki também");
		return null;//findByAdicionalTrue(produtoFilter, pageable);
	}

}
