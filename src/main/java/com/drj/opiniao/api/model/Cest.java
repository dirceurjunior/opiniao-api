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
import javax.validation.constraints.NotBlank;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Data
public class Cest implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(nullable = false, length = 50)
	private String cest;

	@NotBlank
	@Column(nullable = false, columnDefinition = "text")
	private String descricao;

	@NotBlank
	@Column(nullable = false, length = 50)
	private String ncm;

//	@OneToMany(mappedBy = "cest", cascade = CascadeType.ALL)
//	private List<Produto> produtos = new ArrayList<>();

}
