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

import org.hibernate.annotations.NaturalId;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Data
public class Ncm implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@NaturalId
	@Column(nullable = false, length = 100)
	private String ncm;

	@NotBlank
	@Column(nullable = false, length = 100)
	private String descricao;

//	@OneToMany(mappedBy = "ncm", cascade = CascadeType.ALL)
//	private List<Produto> produtos = new ArrayList<>();

	public String getNcmDescricao() {
		return ncm + " - " + descricao;
	}

}
