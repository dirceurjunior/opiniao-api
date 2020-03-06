package com.drj.opiniao.api.service;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.drj.opiniao.api.model.Unidade;
import com.drj.opiniao.api.repository.Unidades;

@Service
public class UnidadeService {

	@Autowired
	private Unidades unidades;

	public Unidade atualizar(Long id, Unidade unidade) {
		Unidade unidadeSalva = buscarUnidadePeloCodigo(id);
		BeanUtils.copyProperties(unidade, unidadeSalva, "id");
		return unidades.save(unidadeSalva);
	}

	private Unidade buscarUnidadePeloCodigo(Long id) {
		Unidade unidadeSalva = unidades.findById(id).orElseThrow(() -> new EmptyResultDataAccessException(1));
		return unidadeSalva;
	}

	public Unidade salvar(@Valid Unidade unidade) {
		return unidades.save(unidade);
	}
}
