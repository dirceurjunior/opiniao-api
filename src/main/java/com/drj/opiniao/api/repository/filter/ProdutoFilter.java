package com.drj.opiniao.api.repository.filter;

import com.drj.opiniao.api.model.Categoria;

import lombok.Data;

@Data
public class ProdutoFilter {

	private String nome;

	private Categoria categoria;

}
