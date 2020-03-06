/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drj.opiniao.api.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.drj.opiniao.api.en.TipoAtivoInativo;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Data
public class Produto implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Size(max = 150)
	@Column(nullable = false, length = 150)
	private String nome;

	@Size(min = 7, max = 13)
	@Column(name = "codigo_barras", unique = true)
	private String codigoBarras;

	@Column(columnDefinition = "text")
	private String caracteristica;

//	@Column(length = 50)
//	private String referencia;

	@NotNull
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm:ss")
	@Column(name = "data_cadastro", nullable = false)
	private LocalDateTime dataCadastro = LocalDateTime.now();

//	@Column(name = "data_ultima_alteracao")
//	private LocalDateTime dataUltimaAlteracao;

//	@Column(name = "data_ultima_compra")
//	// @JsonFormat(pattern = "dd/MM/yyyy")
//	private LocalDateTime dataUltimaCompra;

//	@Column(name = "data_ultima_venda")
//	private LocalDateTime dataUltimaVenda;

	@NotNull
	@Column(name = "valor_unitario", precision = 10, scale = 2)
	private BigDecimal valorUnitario;

//	@Column(name = "ultimo_custo", precision = 10, scale = 2)
//	private BigDecimal ultimoCusto;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_situacao", nullable = false)
	private TipoAtivoInativo situacao = TipoAtivoInativo.ATIVO;

//	@ManyToOne
//	@JoinColumn(name = "marca_id")
//	private Marca marca;

//	@NotNull
//	@ManyToOne
//	@JoinColumn(name = "cst_id")
//	private Cst cst;
//
//	@NotNull
//	@ManyToOne
//	@JoinColumn(name = "cst_aliquota_ecf_id")
//	private CstAliquotaEcf cstAliquotaEcf;
//
//	@ManyToOne
//	@JoinColumn(name = "cest_id")
//	private Cest cest;

//	@NotNull
//	@ManyToOne
//	@JoinColumn(name = "colaborador_cadastro_id", nullable = false)
//	private Colaborador colaboradorCadastro;
//
//	@ManyToOne
//	@JoinColumn(name = "colaborador_ultima_alteracao_id")
//	private Colaborador colaboradorUltimaAlteracao;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "categoria_id", nullable = false)
	private Categoria categoria;

//	@NotNull
//	@ManyToOne
//	@JoinColumn(name = "ncm_id")
//	private Ncm ncm;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "unidade_id", nullable = false)
	private Unidade unidade;

//	@ManyToOne
//	@JoinColumn(name = "fornecedor_id")
//	private Fornecedor fornecedor;

//	@NotNull
//	@Min(0)
//	@Max(value = 9999, message = "tem um valor muito alto")
//	@Column(name = "quantidade_estoque", nullable = false, length = 5)
//	private Integer quantidadeEstoque;
//
//	@Min(1)
//	@Column(name = "quantidade_minima", length = 5)
//	private Integer quantidadeMinima;
//
//	@Min(1)
//	@Column(name = "quantidade_maxima", length = 5)
//	private Integer quantidadeMaxima;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "produto_ingrediente", joinColumns = @JoinColumn(name = "produto_id"), inverseJoinColumns = @JoinColumn(name = "ingrediente_id"))
	private List<Ingrediente> ingredientes;

//	@Transient
//	public boolean isNovo() {
//		return getId() == null;
//	}
//
//	@Transient
//	public boolean isExistente() {
//		return !isNovo();
//	}

}
