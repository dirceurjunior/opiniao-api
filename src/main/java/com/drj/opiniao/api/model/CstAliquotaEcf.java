/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drj.opiniao.api.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Table(name = "cst_aliquota_ecf")
@Data
public class CstAliquotaEcf implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(name = "aliquota_icms", nullable = false)
	private String aliquotaIcms;

	@NotBlank
	@Column(name = "aliquota_ecf", nullable = false)
	private String aliquotaEcf;

	@ManyToOne
	@JoinColumn(name = "cst_id")
	private Cst cst;

}
