package com.drj.opiniao.api.service;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.drj.opiniao.api.model.Produto;
import com.drj.opiniao.api.repository.Produtos;

@Service
public class ProdutoService {

	@Autowired
	private Produtos produtos;

	@Autowired
	private ProdutoService produtoService;

	public Produto atualizar(Long id, Produto produto) {
		Produto produtoSalva = buscarProdutoPeloCodigo(id);

		BeanUtils.copyProperties(produto, produtoSalva, "id");
		return produtos.save(produtoSalva);
	}

	public void atualizarPropriedadeAtivo(Long id, Boolean ativo) {
		Produto produtoSalva = buscarProdutoPeloCodigo(id);
		produtos.save(produtoSalva);
	}

	private Produto buscarProdutoPeloCodigo(Long id) {
		Produto produtoSalva = produtos.findById(id).orElseThrow(() -> new EmptyResultDataAccessException(1));
		return produtoSalva;
	}

	public Produto salvar(@Valid Produto produto) {
		return produtos.save(produto);
	}
}
