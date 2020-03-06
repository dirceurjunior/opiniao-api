package com.drj.opiniao.api.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.drj.opiniao.api.model.Cliente;

public interface Clientes extends JpaRepository<Cliente, Long> {

	public Page<Cliente> findByNomeRazaoSocialContainingIgnoreCaseOrderByNomeRazaoSocial(String nomeRazaoSocial,
			Pageable pageable);

}
