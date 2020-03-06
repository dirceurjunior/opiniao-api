/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drj.opiniao.api.en;

/**
 *
 * @author Dirceu Junior
 */
public enum TipoOperacao {

	CUPOM_FISCAL("Cupom Fiscal"), DIRETA("Venda Direta"), NFE("Nota Fiscal Eletrônica"), ORCAMENTO("Orçamento"),
	CONDICIONAL("Condicional"), ROMANEIO("Romaneio"), PEDIDO("Pedido");

	private String descricao;

	TipoOperacao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

}
