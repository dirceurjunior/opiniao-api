package com.drj.opiniao.api.repository.produto;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.drj.opiniao.api.model.Produto;
import com.drj.opiniao.api.repository.filter.ProdutoFilter;
import com.drj.opiniao.api.repository.projection.ResumoProduto;

public interface ProdutosQuery {

	public Page<Produto> filtrar(ProdutoFilter produtoFilter, Pageable pageable);
	
	public Page<Produto> findByAdicionalTrue(ProdutoFilter produtoFilter, Pageable pageable);

	public Page<ResumoProduto> resumir(ProdutoFilter produtoFilter, Pageable pageable);

}
