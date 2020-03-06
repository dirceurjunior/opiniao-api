package com.drj.opiniao.api.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.drj.opiniao.api.model.Usuario;

public interface Usuarios extends JpaRepository<Usuario, Long> {

	public Optional<Usuario> findByEmail(String email);
}
