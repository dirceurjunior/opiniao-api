/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drj.opiniao.api.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
public class Classe implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(nullable = false, length = 80)
	private String descricao;

	@NotNull
	@Column(name = "percentual_desconto", nullable = false, precision = 10, scale = 2)
	private BigDecimal percentualDesconto;

//	@OneToMany(mappedBy = "classe")
//	private List<Cliente> clientes = new ArrayList<>();

	@ManyToOne
	@JoinColumn(name = "tabela_preco_id")
	private TabelaPreco tabelaPreco;

	

}
