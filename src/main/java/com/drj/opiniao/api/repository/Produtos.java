package com.drj.opiniao.api.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.drj.opiniao.api.model.Produto;
import com.drj.opiniao.api.repository.produto.ProdutosQuery;

public interface Produtos extends JpaRepository<Produto, Long>, ProdutosQuery {

	public Page<Produto> findByNomeContainingIgnoreCaseOrderByNome(String nome, Pageable pageable);

	public List<Produto> findByCategoriaId(Long categoria);

	// List<Produto> findByCategoria(@Param("categoria") @RequestParam("categoria")
	// String categoria);

}
