package com.drj.opiniao.api.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.drj.opiniao.api.model.Categoria;

public interface Categorias extends JpaRepository<Categoria, Long> {

	public Page<Categoria> findByDescricaoContainingIgnoreCaseOrderByDescricao(String descricao, Pageable pageable);

}
