package com.drj.opiniao.api.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.drj.opiniao.api.model.Ingrediente;

public interface Ingredientes extends JpaRepository<Ingrediente, Long> {

	public Page<Ingrediente> findByNomeContainingIgnoreCaseOrderByNome(String nome, Pageable pageable);

}