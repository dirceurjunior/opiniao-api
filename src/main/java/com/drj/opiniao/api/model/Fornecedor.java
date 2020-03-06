/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drj.opiniao.api.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.drj.opiniao.api.en.TipoAtivoInativo;
import com.drj.opiniao.api.en.TipoPessoa;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Data
public class Fornecedor implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Size(max = 200)
	@Column(name = "nome_razao_social", nullable = false, length = 200)
	private String nomeRazaoSocial;

	@NotBlank
	@Size(max = 200)
	@Column(name = "sobrenome_nome_fantasia", nullable = false, length = 200)
	private String sobrenomeNomeFantasia;

	@NotBlank
	@Column(name = "cpf_cnpj", nullable = false, length = 20)
	private String cpfCnpj;

	@NotBlank
	@Column(name = "rg_ie", nullable = false, length = 20)
	private String rgInscricaoEstadual;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_pessoa")
	private TipoPessoa tipoPessoa = TipoPessoa.JURIDICA;

	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_situacao", nullable = false)
	private TipoAtivoInativo tipoSituacao = TipoAtivoInativo.ATIVO;

	@NotNull
	@Column(name = "data_cadastro", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCadastro = new Date();

	@Column(name = "data_ultima_alteracao")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataUltimaAlteracao;

	@Column(name = "data_ultima_compra")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataUltimaCompra;

	@Column(name = "valor_ultima_compra", precision = 10, scale = 2)
	private BigDecimal valorUltimaCompra = BigDecimal.ZERO;

	@Column(name = "notafiscal_ultima_compra")
	private Long notaFiscalUltimaCompra;

	@Size(max = 200)
	@Column(name = "contato_interno", length = 200)
	private String contatoInterno;

	@Size(max = 100)
	@Column(length = 100)
	private String sac;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "colaborador_cadastro_id", nullable = false)
	private Colaborador colaboradorCadastro;

	@ManyToOne
	@JoinColumn(name = "colaborador_ultima_alteracao_id")
	private Colaborador colaboradorUltimaAlteracao;

	@OneToMany(mappedBy = "fornecedor", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Endereco> enderecos = new ArrayList<>();

	@OneToMany(mappedBy = "fornecedor", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Email> emails = new ArrayList<>();

	@OneToMany(mappedBy = "fornecedor", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Contato> contatos = new ArrayList<>();

//	@OneToMany(mappedBy = "fornecedor")
//	private List<Produto> produtos = new ArrayList<>();

	@Transient
	public boolean isNovo() {
		return getId() == null;
	}

	@Transient
	public boolean isExistente() {
		return !isNovo();
	}

	public String getNomeFantasiaRazaoSocial() {
		return sobrenomeNomeFantasia + " - " + nomeRazaoSocial;
	}

}
