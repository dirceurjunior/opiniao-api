/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drj.opiniao.api.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Data
public class Colaborador implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Size(max = 250)
	@Column(nullable = false, length = 250)
	private String nome;

	@NotBlank
	@Size(max = 14)
	@Column(length = 14)
	private String cpf;

	@NotBlank
	@Size(max = 14)
	@Column(length = 14)
	private String rg;

	@NotNull
	@Column(name = "data_admissao", nullable = false)
	@Temporal(javax.persistence.TemporalType.TIMESTAMP)
	private Date dataAdmissao;

	@Column(name = "data_desligamento")
	@Temporal(javax.persistence.TemporalType.TIMESTAMP)
	private Date dataDesligamento;

	@ManyToOne
	@JoinColumn(name = "loja_id")
	private Loja loja;

	@OneToMany(mappedBy = "colaborador", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
	private List<Contato> contatos = new ArrayList<>();

	@OneToMany(mappedBy = "colaborador", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
	private List<Endereco> enderecos = new ArrayList<>();

	@OneToMany(mappedBy = "colaborador", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
	private List<Email> emails = new ArrayList<>();

//	@OneToOne(mappedBy = "colaborador")
//	private Usuario usuario;

	private String cor;

	@Transient
	public boolean isNovo() {
		return getId() == null;
	}

	@Transient
	public boolean isExistente() {
		return !isNovo();
	}

}
