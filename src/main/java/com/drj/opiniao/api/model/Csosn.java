/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drj.opiniao.api.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Data
public class Csosn implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(nullable = false)
	private String csosn;

	@NotBlank
	@Column(nullable = false, columnDefinition = "text")
	private String descricao;

	@NotBlank
	@Column(nullable = false, columnDefinition = "text")
	private String classificacao;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "operacao_fiscal_id", nullable = false)
	private OperacaoFiscal operacao_fiscao;

	@ManyToMany
	@JoinTable(name = "csosn_cst", joinColumns = @JoinColumn(name = "csosn_id"), inverseJoinColumns = @JoinColumn(name = "cst_id"))
	private List<Cst> csts = new ArrayList<>();

}
