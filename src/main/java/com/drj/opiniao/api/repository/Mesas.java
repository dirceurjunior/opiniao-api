package com.drj.opiniao.api.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.drj.opiniao.api.model.Mesa;

public interface Mesas extends JpaRepository<Mesa, Long> {

	public Page<Mesa> findAll(Pageable pageable);
	
}
