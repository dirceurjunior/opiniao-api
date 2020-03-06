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
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Data
public class Cst implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(length = 10, nullable = false)
	private String cst;

	@NotBlank
	@Column(length = 150, nullable = false)
	private String descricao;

	@NotBlank
	@Column(name = "tipo_operacao_venda", nullable = false, length = 10)
	private String identificacaoTipoOperacaoVenda;

	@ManyToMany(mappedBy = "csts")
	private List<Csosn> csosn;

	@OneToMany(mappedBy = "cst")
	private List<CstAliquotaEcf> cstAliquotaEcfs = new ArrayList<>();

}
