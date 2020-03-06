package com.drj.opiniao.api.service;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.drj.opiniao.api.model.Categoria;
import com.drj.opiniao.api.repository.Categorias;

@Service
public class CategoriaService {

	@Autowired
	private Categorias categorias;

	public Categoria atualizar(Long id, Categoria categoria) {
		Categoria categoriaSalva = buscarCategoriaPeloCodigo(id);
		BeanUtils.copyProperties(categoria, categoriaSalva, "id");
		return categorias.save(categoriaSalva);
	}

	private Categoria buscarCategoriaPeloCodigo(Long id) {
		Categoria categoriaSalva = categorias.findById(id).orElseThrow(() -> new EmptyResultDataAccessException(1));
		return categoriaSalva;
	}

	public Categoria salvar(@Valid Categoria categoria) {
		return categorias.save(categoria);
	}
}
