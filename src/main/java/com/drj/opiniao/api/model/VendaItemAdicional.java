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
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "venda_item_adicional")
public class VendaItemAdicional implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 5)
	private Integer quantidade = 1;

	@Column(name = "valor_unitario", precision = 10, scale = 2)
	private BigDecimal valorUnitario = BigDecimal.ZERO;

	@ManyToOne
	@JoinColumn(name = "venda_item_id", nullable = false)
	private VendaItem vendaItem;

	private Ingrediente ingrediente;

	public BigDecimal getValorTotalAdicional() {
		return this.getValorUnitario().multiply(new BigDecimal(this.getQuantidade()));
	}
}
