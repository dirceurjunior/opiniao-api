package com.drj.opiniao.api.en;

/**
 *
 * @author Dirceu Junior
 */
public enum TipoAtivoInativo {

    ATIVO("ATIVO"), 
    INATIVO("INATIVO");

    private String descricao;

    TipoAtivoInativo(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

}
