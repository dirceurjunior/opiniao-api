package com.drj.opiniao.api.service;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.drj.opiniao.api.model.Ingrediente;
import com.drj.opiniao.api.repository.Ingredientes;

@Service
public class IngredienteService {

	@Autowired
	private Ingredientes ingredientes;

	public Ingrediente atualizar(Long id, Ingrediente ingrediente) {
		Ingrediente ingredienteSalva = buscarIngredientePeloCodigo(id);
		BeanUtils.copyProperties(ingrediente, ingredienteSalva, "id");
		return ingredientes.save(ingredienteSalva);
	}

	private Ingrediente buscarIngredientePeloCodigo(Long id) {
		Ingrediente ingredienteSalva = ingredientes.findById(id)
				.orElseThrow(() -> new EmptyResultDataAccessException(1));
		return ingredienteSalva;
	}

	public Ingrediente salvar(@Valid Ingrediente ingrediente) {
		return ingredientes.save(ingrediente);
	}
}
