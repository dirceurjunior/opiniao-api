package com.drj.opiniao.api.model;

import java.beans.Transient;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import com.drj.opiniao.api.en.TipoDesconto;
import com.drj.opiniao.api.en.TipoOperacao;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Entity
@Data
public class Venda implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Column(name = "data_criacao", nullable = false)
	private LocalDateTime dataCriacao = LocalDateTime.now();

	@Column(name = "data_venda")
	private LocalDateTime dataVenda;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "operacao", nullable = false)
	private TipoOperacao operacao = TipoOperacao.PEDIDO;

//	@NotNull
//	@ManyToOne
//	@JoinColumn(name = "colaborador_id", nullable = false)
//	private Colaborador colaborador;

	@ManyToOne
	@JoinColumn(name = "cliente_id")
	private Cliente cliente;

	@ManyToOne
	@JoinColumn(name = "mesa_id")
	private Mesa mesa;

//	@ManyToOne
//	@JoinColumn(name = "caixa_id")
//	private Caixa caixa;

	@NotNull
	@Column(name = "valor_total_com_desconto", nullable = false, precision = 10, scale = 2)
	private BigDecimal valorTotalComDesconto = BigDecimal.ZERO;

	@NotNull
	@Column(name = "valor_total_sem_desconto", nullable = false, precision = 10, scale = 2)
	private BigDecimal valorTotalSemDesconto = BigDecimal.ZERO;

	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_desconto")
	private TipoDesconto tipoDesconto;

	@Column(name = "valor_desconto_venda", precision = 10, scale = 2)
	private BigDecimal valorDescontoVenda = BigDecimal.ZERO;

	@Column(columnDefinition = "text")
	private String observacao;

	@OneToMany(targetEntity = VendaItem.class, cascade = CascadeType.ALL)
	// @Fetch(FetchMode.SUBSELECT)
	@JoinColumn(name = "venda_id")
	private List<VendaItem> itens = new ArrayList<>();

	// @Column(name = "cpf_nfp", length = 20)
	// private String cpfNfp;

	@JsonIgnore
	public BigDecimal getValorSubtotal() {
		return this.getValorTotalSemDesconto();
	}

	// @JsonIgnore
	public BigDecimal getValorTotal() {
		BigDecimal valorTotal = BigDecimal.ZERO;
		for (VendaItem item : this.getItens()) {
			if (item.getProduto() != null && item.getProduto().getId() != null) {
				if (item.getValorTotalComDesconto().compareTo(BigDecimal.ZERO) > 0) {
					valorTotal = valorTotal.add(item.getValorTotalComDesconto());
				} else {
					valorTotal = valorTotal.add(item.getValorTotalSemDesconto());
				}
			}
		}
		return valorTotal;
	}

	@JsonIgnore
	public BigDecimal getValorTotalDesconto() {
		BigDecimal valor = BigDecimal.ZERO;
		for (VendaItem item : this.getItens()) {
			if (item.getProduto() != null && item.getProduto().getId() != null) {
				if (item.getValorTotalComDesconto().compareTo(BigDecimal.ZERO) > 0) {
					valor = valor.add(item.getValorTotalSemDesconto().subtract(item.getValorTotalComDesconto()));
				}
			}
		}
		return valor.add(getValorDescontoVenda());
	}

	@JsonIgnore
	public void recalcularValoresTotais() {
		BigDecimal totalSemDesconto = BigDecimal.ZERO;
		BigDecimal totalComDesconto = BigDecimal.ZERO;
		for (VendaItem item : this.getItens()) {
			if (item.getProduto() != null && item.getProduto().getId() != null) {
				totalSemDesconto = totalSemDesconto.add(item.getValorTotalSemDesconto());
				totalComDesconto = totalComDesconto.add(item.getValorTotalComDesconto());
			}
		}
		this.setValorTotalSemDesconto(totalSemDesconto);
		if ((TipoDesconto.PORCENTAGEM.equals(this.getTipoDesconto()))
				|| (TipoDesconto.VALOR.equals(this.getTipoDesconto()))) {
			this.setValorTotalComDesconto(totalSemDesconto.subtract(getValorDescontoVenda()));
		} else {
			this.setValorTotalComDesconto(totalComDesconto);
		}
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////// METODO QUE RETORNA QUANTIDADE DE ITENS NA VENDA
	///////////////////////////////////////////////////////////////////////////////////////////////// ////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
	@JsonIgnore
	public Integer recalcularQuantidadeProdutosTotal() {
		Integer total = 0;
		for (VendaItem item : this.getItens()) {
			if (item.getProduto() != null && item.getProduto().getId() != null) {
				total = total + item.getQuantidade();
			}
		}
		return total;
	}

	@JsonIgnore
	@Transient
	public boolean isNovo() {
		return getId() == null;
	}

	@JsonIgnore
	@Transient
	public boolean isExistente() {
		return !isNovo();
	}

	@JsonIgnore
	@Transient
	public boolean isClienteExistente() {
		return getCliente() != null;
	}

	@JsonIgnore
	@Transient
	public boolean isCupomFiscal() {
		return TipoOperacao.CUPOM_FISCAL.equals(this.getOperacao());
	}

	@JsonIgnore
	@Transient
	public boolean isNFE() {
		return TipoOperacao.NFE.equals(this.getOperacao());
	}

	@JsonIgnore
	@Transient
	public boolean isOrcamento() {
		return TipoOperacao.ORCAMENTO.equals(this.getOperacao());
	}

	@JsonIgnore
	@Transient
	public boolean isDireta() {
		return TipoOperacao.DIRETA.equals(this.getOperacao());
	}

	@JsonIgnore
	@Transient
	public boolean isCondicional() {
		return TipoOperacao.CONDICIONAL.equals(this.getOperacao());
	}

	@JsonIgnore
	@Transient
	public boolean isPedido() {
		return TipoOperacao.PEDIDO.equals(this.getOperacao());
	}

	@JsonIgnore
	@Transient
	public boolean isValorTotalNegativo() {
		return this.getValorTotalComDesconto().compareTo(BigDecimal.ZERO) < 0;
	}

	@JsonIgnore
	@Transient
	public boolean isTipoDescontoInformado() {
		return ((TipoDesconto.PORCENTAGEM.equals(this.getTipoDesconto()))
				|| (TipoDesconto.VALOR.equals(this.getTipoDesconto())));
	}

	@JsonIgnore
	@Transient
	public boolean isDescontoPorcentagem() {
		return TipoDesconto.PORCENTAGEM.equals(this.getTipoDesconto());
	}

	@JsonIgnore
	@Transient
	public boolean isDescontoValor() {
		return TipoDesconto.VALOR.equals(this.getTipoDesconto());
	}

}
