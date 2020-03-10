package com.drj.opiniao.api.repository.projection;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.drj.opiniao.api.en.TipoDesconto;
import com.drj.opiniao.api.en.TipoOperacao;
import com.drj.opiniao.api.model.VendaItem;

import lombok.Data;

@Data
public class ResumoVenda {

	private Long id;
	private LocalDateTime dataCriacao;
	private LocalDate dataVenda;

	private TipoOperacao tipoOperacao;

	private String cliente;
	private String mesa;

	private BigDecimal valorTotalComDesconto;
	private BigDecimal valorTotalSemDesconto;

	private TipoDesconto tipoDesconto;
	private BigDecimal valorDescontoVenda;

	private List<VendaItem> itens = new ArrayList<>();

	public ResumoVenda(Long id, LocalDateTime dataCriacao, LocalDate dataVenda, TipoOperacao tipoOperacao,
			String cliente, String mesa, BigDecimal valorTotalComDesconto, BigDecimal valorTotalSemDesconto,
			TipoDesconto tipoDesconto, BigDecimal valorDescontoVenda, List<VendaItem> itens) {
		super();
		this.id = id;
		this.dataCriacao = dataCriacao;
		this.dataVenda = dataVenda;
		this.tipoOperacao = tipoOperacao;
		this.cliente = cliente;
		this.mesa = mesa;
		this.valorTotalComDesconto = valorTotalComDesconto;
		this.valorTotalSemDesconto = valorTotalSemDesconto;
		this.tipoDesconto = tipoDesconto;
		this.valorDescontoVenda = valorDescontoVenda;
		this.itens = itens;
	}

}
