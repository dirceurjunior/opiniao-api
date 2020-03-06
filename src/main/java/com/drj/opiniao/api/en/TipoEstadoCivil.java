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
public enum TipoEstadoCivil {

    SOLTEIRO("SOLTEIRO(A)"),
    CASADO("CASADO(A)"),
    DIVORCIADO("DIVORCIADO(A)"),
    AMASIADO("AMASIADO(A)"),
    VIUVO("VIÚVO(A)");

    private String descricao;

    TipoEstadoCivil(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

}
