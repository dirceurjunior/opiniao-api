package com.drj.opiniao.api.repository.venda;

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

import com.drj.opiniao.api.model.Venda;
import com.drj.opiniao.api.repository.filter.VendaFilter;
import com.drj.opiniao.api.repository.projection.ResumoVenda;

public class VendasImpl implements VendasQuery {

	@PersistenceContext
	private EntityManager manager;

	@Override
	public Page<Venda> filtrar(VendaFilter vendaFilter, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Venda> criteria = builder.createQuery(Venda.class);
		Root<Venda> root = criteria.from(Venda.class);

		// criar as restrições
		Predicate[] predicates = criarRestricoes(vendaFilter, builder, root);
		criteria.where(predicates);

		TypedQuery<Venda> query = manager.createQuery(criteria);
		adicionarRestricoesDePaginacao(query, pageable);

		return new PageImpl<>(query.getResultList(), pageable, total(vendaFilter));
	}

	@Override
	public Page<ResumoVenda> resumir(VendaFilter vendaFilter, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<ResumoVenda> criteria = builder.createQuery(ResumoVenda.class);
		Root<Venda> root = criteria.from(Venda.class);

//		criteria.select(builder.construct(ResumoVenda.class, root.get(id), root.get(Venda_.descricao),
//				root.get(Venda_.dataVencimento), root.get(Venda_.dataPagamento), root.get(Venda_.valor),
//				root.get(Venda_.tipo), root.get(Venda_.categoria).get(Categoria_.nome),
//				root.get(Venda_.pessoa).get(Pessoa_.nome)));

		Predicate[] predicates = criarRestricoes(vendaFilter, builder, root);
		criteria.where(predicates);

		TypedQuery<ResumoVenda> query = manager.createQuery(criteria);
		adicionarRestricoesDePaginacao(query, pageable);

		return new PageImpl<>(query.getResultList(), pageable, total(vendaFilter));
	}

	private Long total(VendaFilter vendaFilter) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
		Root<Venda> root = criteria.from(Venda.class);
		// criar as restrições
		Predicate[] predicates = criarRestricoes(vendaFilter, builder, root);
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

	private Predicate[] criarRestricoes(VendaFilter vendaFilter, CriteriaBuilder builder, Root<Venda> root) {

		List<Predicate> predicates = new ArrayList<>();

//		if (!StringUtils.isEmpty(vendaFilter.getDescricao())) {
//			predicates.add(builder.like(builder.lower(root.get(Venda_.DESCRICAO)),
//					"%" + vendaFilter.getDescricao().toLowerCase() + "%"));
//		}
//
//		if (vendaFilter.getDataVencimentoDe() != null) {
//			predicates.add(
//					builder.greaterThanOrEqualTo(root.get(Venda_.DATA_VENCIMENTO), vendaFilter.getDataVencimentoDe()));
//		}
//
//		if (vendaFilter.getDataVencimentoAte() != null) {
//			predicates.add(
//					builder.lessThanOrEqualTo(root.get(Venda_.DATA_VENCIMENTO), vendaFilter.getDataVencimentoAte()));
//		}

		return predicates.toArray(new Predicate[predicates.size()]);
	}

}
