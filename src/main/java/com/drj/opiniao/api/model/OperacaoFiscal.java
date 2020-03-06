/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drj.opiniao.api.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.drj.opiniao.api.en.TipoEntradaSaida;
import com.drj.opiniao.api.en.TipoNaturezaOperacao;

/**
 *
 * @author Dirceu Junior
 */
@Entity(name = "operacao_fiscal")
public class OperacaoFiscal implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(name = "descricao", nullable = false, length = 200)
	private String descricao;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(nullable = false, length = 10)
	private TipoEntradaSaida tipoOperacao;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false, length = 200)
	private TipoNaturezaOperacao tipoNaturezaOperacao;

	@NotBlank
	@Column(name = "cfop_dentro_estado", nullable = false)
	private String cfopDentroEstado;

	@NotBlank
	@Column(name = "cfop_fora_estado", nullable = false)
	private String cfopForaEstado;

	@NotBlank
	@Column(name = "id_operacao_contraria", nullable = false)
	private String idOperacaoContraria;

	//@OneToMany(mappedBy = "tipoOperacao", cascade = CascadeType.ALL)
	//private List<Csosn> csosns = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public TipoEntradaSaida getTipoOperacao() {
		return tipoOperacao;
	}

	public void setTipoOperacao(TipoEntradaSaida tipoOperacao) {
		this.tipoOperacao = tipoOperacao;
	}

	public TipoNaturezaOperacao getTipoNaturezaOperacao() {
		return tipoNaturezaOperacao;
	}

	public void setTipoNaturezaOperacao(TipoNaturezaOperacao tipoNaturezaOperacao) {
		this.tipoNaturezaOperacao = tipoNaturezaOperacao;
	}

	public String getCfopDentroEstado() {
		return cfopDentroEstado;
	}

	public void setCfopDentroEstado(String cfopDentroEstado) {
		this.cfopDentroEstado = cfopDentroEstado;
	}

	public String getCfopForaEstado() {
		return cfopForaEstado;
	}

	public void setCfopForaEstado(String cfopForaEstado) {
		this.cfopForaEstado = cfopForaEstado;
	}

	public String getIdOperacaoContraria() {
		return idOperacaoContraria;
	}

	public void setIdOperacaoContraria(String idOperacaoContraria) {
		this.idOperacaoContraria = idOperacaoContraria;
	}

//	public List<Csosn> getCsosns() {
//		return csosns;
//	}
//
//	public void setCsosns(List<Csosn> csosns) {
//		this.csosns = csosns;
//	}

	@Override
	public int hashCode() {
		int hash = 3;
		hash = 67 * hash + Objects.hashCode(this.id);
		return hash;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final OperacaoFiscal other = (OperacaoFiscal) obj;
		if (!Objects.equals(this.id, other.id)) {
			return false;
		}
		return true;
	}

}
