package com.drj.opiniao.api.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "permissao")
@Data
public class Permissao {

	@Id
	private Long id;
	private String descricao;

}