package com.drj.opiniao.api.en;

/**
 *
 * @author Dirceu Junior
 */
public enum TipoDesconto {

	PORCENTAGEM("Porcentagem"), VALOR("Valor");

	private String descricao;

	TipoDesconto(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

}
