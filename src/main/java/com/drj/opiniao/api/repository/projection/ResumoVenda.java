package com.drj.opiniao.api.repository.projection;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.drj.opiniao.api.en.TipoAtivoInativoBloqueado;
import com.drj.opiniao.api.en.TipoPessoa;

import lombok.Data;

@Data
public class ResumoVenda {

	private Long id;
	private String nomeRazaoSocial;
	private String nomeFantasia;
	private String cpfCnpj;
	private String rgInscricaoEstadual;
	private LocalDateTime dataCadastro;
	private LocalDate dataPagamento;
	private TipoPessoa pessoa;
	private TipoAtivoInativoBloqueado situacao;

	public ResumoVenda(Long id, String nomeRazaoSocial, String nomeFantasia, String cpfCnpj, String rgInscricaoEstadual,
			LocalDateTime dataCadastro, LocalDate dataPagamento, TipoPessoa pessoa,
			TipoAtivoInativoBloqueado situacao) {
		super();
		this.id = id;
		this.nomeRazaoSocial = nomeRazaoSocial;
		this.nomeFantasia = nomeFantasia;
		this.cpfCnpj = cpfCnpj;
		this.rgInscricaoEstadual = rgInscricaoEstadual;
		this.dataCadastro = dataCadastro;
		this.dataPagamento = dataPagamento;
		this.pessoa = pessoa;
		this.situacao = situacao;
	}

}
