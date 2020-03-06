package com.drj.opiniao.api.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.drj.opiniao.api.en.TipoSimNao;

import lombok.Data;

@Entity
@Data
public class Ingrediente implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(nullable = false, length = 100)
	private String nome;

	@NotNull
	@Enumerated(EnumType.STRING)
	private TipoSimNao adicional;

	@Column(name = "valor_de_custo", precision = 10, scale = 2)
	private BigDecimal ultimoCusto;

	@NotNull
	@Column(name = "valor_de_venda", precision = 10, scale = 2)
	private BigDecimal valorUnitario;

}
