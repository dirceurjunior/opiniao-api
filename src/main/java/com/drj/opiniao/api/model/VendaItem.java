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
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Entity
@Data
@Table(name = "venda_item")
public class VendaItem implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 5)
	private Integer quantidade = 1;

	@Column(name = "valor_unitario_sem_desconto", nullable = false, precision = 10, scale = 2)
	private BigDecimal valorUnitarioSemDesconto = BigDecimal.ZERO;

	@Column(name = "valor_unitario_com_desconto", nullable = false, precision = 10, scale = 2)
	private BigDecimal valorUnitarioComDesconto = BigDecimal.ZERO;

//	@Column(name = "valor_tributacao_estadual", nullable = false, precision = 10, scale = 2)
//	private BigDecimal valorTributacaoEstadual = BigDecimal.ZERO;
//
//	@Column(name = "valor_tributacao_federal", nullable = false, precision = 10, scale = 2)
//	private BigDecimal valorTributacaoFederal = BigDecimal.ZERO;
//
//	@Column(name = "valor_tributacao_importado", nullable = false, precision = 10, scale = 2)
//	private BigDecimal valorTributacaoImportado = BigDecimal.ZERO;
//
//	@Column(name = "valor_tributacao_municipal", nullable = false, precision = 10, scale = 2)
//	private BigDecimal valorTributacaoMunicipal = BigDecimal.ZERO;

	@ManyToOne
	@JoinColumn(name = "produto_id", nullable = false)
	// @JsonIgnore
	private Produto produto;

	@JsonIgnore
	// @JsonManagedReference
	@ManyToOne
	@JoinColumn(name = "venda_id")
	private Venda venda;

	// @ManyToOne
	// @JoinColumn(name = "venda_id", nullable = false)
	// private Venda venda;

//	@ManyToOne
//	@JoinColumn(name = "colaborador_id", nullable = false)
//	private Colaborador colaborador;

	@JsonIgnore
	@Transient
	public BigDecimal getValorTotal() {
		if (!valorUnitarioComDesconto.equals(BigDecimal.ZERO)) {
			return getValorTotalComDesconto();// this.getValorUnitarioComDesconto().multiply(new
												// BigDecimal(this.getQuantidade()));
		} else {
			return getValorTotalSemDesconto();// this.getValorUnitarioSemDesconto().multiply(new
												// BigDecimal(this.getQuantidade()));
		}
	}

	@JsonIgnore
	@Transient
	public BigDecimal getValorTotalSemDesconto() {
		return this.getValorUnitarioSemDesconto().multiply(new BigDecimal(this.getQuantidade()));
	}

	@JsonIgnore
	@Transient
	public BigDecimal getValorTotalComDesconto() {
		return this.getValorUnitarioComDesconto().multiply(new BigDecimal(this.getQuantidade()));
	}

	@JsonIgnore
	@Transient
	public boolean isProdutoAssociado() {
		return this.getProduto() != null && this.getProduto().getId() != null;
	}

//    @Transient
//    public boolean isSituacaoEstoque() {
//        return this.getVenda().isEmitido() || this.getProduto().getId() == null
//                || this.getProduto().getQuantidadeEstoque() >= this.getQuantidade();
//    }

//	@Transient
//	public boolean isEstoqueSuficiente() {
//		return this.getProduto().getId() == null || this.getProduto().getQuantidadeEstoque() >= this.getQuantidade();
//	}

//	@Transient
//	public boolean isEstoqueInsuficiente() {
//		return !isEstoqueSuficiente();
//	}

}
