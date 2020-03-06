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
public enum TipoAtivoInativoBloqueado {

    ATIVO("ATIVO"), 
    INATIVO("INATIVO"), 
    BLOQUEADO("BLOQUEADO - FALTA DE PAGAMENTO"),
    ISENTO("ISENTO DE COBRANÇA");

    private String descricao;

    TipoAtivoInativoBloqueado(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    
}
