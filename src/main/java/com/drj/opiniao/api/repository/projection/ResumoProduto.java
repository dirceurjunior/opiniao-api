package com.drj.opiniao.api.repository.projection;

import com.drj.opiniao.api.model.Categoria;

import lombok.Data;

@Data
public class ResumoProduto {

	private Long id;
	private String nome;
	private Boolean adicional;
	private Categoria categoria;

	public ResumoProduto(Long id, String nome, Boolean adicional, Categoria categoria) {
		super();
		this.id = id;
		this.nome = nome;
		this.adicional = adicional;
		this.categoria = categoria;
	}

}
