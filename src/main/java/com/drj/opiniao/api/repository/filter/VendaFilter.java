package com.drj.opiniao.api.repository.filter;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class VendaFilter {

	private String descricao;

	@JsonFormat(pattern = "dd/MM/yyyy")
	private LocalDate dataVendaDe;

	@JsonFormat(pattern = "dd/MM/yyyy")
	private LocalDate dataVendaAte;

}
