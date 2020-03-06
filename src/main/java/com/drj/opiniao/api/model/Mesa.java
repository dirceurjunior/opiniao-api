package com.drj.opiniao.api.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import com.drj.opiniao.api.en.TipoLivreOcupada;

import lombok.Data;

@Entity
@Data
public class Mesa implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Column(nullable = false)
	private Integer numero;

//	@NotNull
//	@Enumerated(EnumType.STRING)
//	@Column(name = "status", nullable = false)
//	private TipoLivreOcupada status;

}
