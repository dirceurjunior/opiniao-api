package com.drj.opiniao.api.en;

/**
 *
 * @author Dirceu Junior
 */
public enum TipoLivreOcupada {

	LIVRE("LIVRE"), OCUPADA("OCUPADA");

	private String descricao;

	TipoLivreOcupada(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

}
