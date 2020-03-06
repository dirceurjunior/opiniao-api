package com.drj.opiniao.api.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.drj.opiniao.api.model.Unidade;

public interface Unidades extends JpaRepository<Unidade, Long> {

	public Page<Unidade> findByDescricaoContainingIgnoreCaseOrderByDescricao(String descricao, Pageable pageable);

}
