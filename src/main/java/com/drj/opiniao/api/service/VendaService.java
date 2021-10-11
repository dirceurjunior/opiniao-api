package com.drj.opiniao.api.service;

import java.math.BigDecimal;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.drj.opiniao.api.model.Venda;
import com.drj.opiniao.api.model.VendaItem;
import com.drj.opiniao.api.repository.Clientes;
import com.drj.opiniao.api.repository.Vendas;

import lombok.Data;

@Service
@Data
public class VendaService {

	@Autowired
	private Vendas vendas;

	@Autowired
	private Clientes clientes;

	private boolean clienteInformado;

	private Venda venda;

	private BigDecimal descontoIndividual;

	private Integer quantidadeTotalProdutos;

	private VendaItem itemEscolhido;

	public Venda salvar(@Valid Venda venda) {

////		if (venda.getCaixa().isNovo()) {
////			throw new NegocioException("CAIXA ESTÁ FECHADO! FAVOR ABRIR PARA REALIZAR VENDAS.");
////		}
//
//		if (venda.isNovo()) {
//			venda.setDataCriacao(LocalDateTime.now());
//		}
//
//		if (venda.getItens().isEmpty()) {
//			// throw new NegocioException("Venda deve possuir pelo menos um item.");
//		}
//		if (venda.isValorTotalNegativo()) {
//			// throw new NegocioException("Valor total da venda não pode ser negativo.");
//		}
//
//		if (venda.isOrcamento() || venda.isCondicional() || venda.isPedido() || venda.isNFE()) {
//			if (!venda.isClienteExistente()) {
//				// throw new NegocioException("Obrigatório informar cliente para Condicional,
//				// Orçamento, Pedido, NFE.");
//			}
//		}
//
//		if (venda.isDireta()) {
//			if (venda.getPagamentos().isEmpty()) {
//				throw new NegocioException("Informar forma de pagamento.");
//			}
//
//			BigDecimal valorPago = BigDecimal.ZERO;
//			for (VendaPagamento venda_pagamento : venda.getPagamentos()) {
//				valorPago = valorPago.add(venda_pagamento.getValorPagamento());
//			}
//			if (valorPago.compareTo(venda.getValorTotal().subtract(venda.getValorDescontoVenda())) < 0) {
//				throw new NegocioException("Pagamento não atingiu o Valor Total.");
//			}
//			if (!venda.isClienteExistente()) {
//				venda.setCliente(clientes.porId(new Long(1)));
//			}
//		}

		// venda.recalcularValoresTotais();

		// venda.setColaborador(usuarioLogado.getUsuario().getColaborador());

		System.out.println(" 1 venda " + venda);
		//venda.setItens(itens);
		recalcularVenda(venda);
		return vendas.save(this.venda);
	}

	public Venda atualizar(Long id, Venda venda) {
		Venda vendaSalva = buscarVendaPeloCodigo(id);
		BeanUtils.copyProperties(venda, vendaSalva, "id");
		return vendas.save(vendaSalva);
	}

	private Venda buscarVendaPeloCodigo(Long id) {
		Venda vendaSalva = vendas.findById(id).orElseThrow(() -> new EmptyResultDataAccessException(1));
		return vendaSalva;
	}

//	public void limpar() {
//		venda = new Venda();
//		novaFormaPagamento();
//		clienteInformado = false;
//		valorDescontoInformado = BigDecimal.ZERO;
//		quantidadeTotalProdutos = 0;
//	}

	public void recalcularVenda(Venda venda) {
		if (venda != null) {
			if (venda.isDescontoValor()) {
				// venda.setValorDescontoVenda(getValorDescontoInformado());
			} else if (venda.isDescontoPorcentagem()) {
				// BigDecimal porcentagemDesconto = getValorDescontoInformado().divide(new
				// BigDecimal(100));
				// BigDecimal desconto = venda.getValorSubtotal().multiply(porcentagemDesconto);
				// venda.setValorDescontoVenda(desconto);
			}
			this.venda = venda;
			this.venda.recalcularValoresTotais();
		}
	}

//
//	public void carregarProduto() {
//		this.produto = this.produto.trim();
//		if (StringUtils.isEmpty(this.produto.replaceAll("[0-9]", "")) && !this.produto.isEmpty()) {
//			produtoLinhaEditavel = this.produtos.porProduto(this.produto);
//			if (produtoLinhaEditavel != null) {
//				carregarProdutoLinhaEditavel();
//			} else {
//				FacesUtil.addErrorMessage("PRODUTO NÃO CADASTRADO");
//				this.produto = null;
//				produtoLinhaEditavel = null;
//			}
//		} else {
//			this.produto = null;
//		}
//	}
//
//	public void carregarProdutoLinhaEditavel() {
//		VendaItem item = this.venda.getItens().get(0);
//		if (this.produtoLinhaEditavel != null) {
//			if (this.existeItemComProduto(this.produtoLinhaEditavel)) {
//				FacesUtil.addErrorMessage("Produto já informado! Altere a quantidade!");
//				this.produto = null;
//				produtoLinhaEditavel = null;
//			} else {
//				item.setProduto(this.produtoLinhaEditavel);
//				item.setValorUnitarioSemDesconto(this.produtoLinhaEditavel.getValorUnitario());
//				item.setValorUnitarioComDesconto(calculaDescontoProduto());
//				if (produtoLinhaEditavel.getNcm() != null) {
//					item.setValorTributacaoEstadual(calcularTributacaoEstadual());
//					item.setValorTributacaoFederal(calcularTributacaoFederal());
//					item.setValorTributacaoImportado(calcularTributacaoImportado());
//					item.setValorTributacaoMunicipal(calcularTributacaoMunicipal());
//				}
//				item.setColaborador(usuarioLogado.getUsuario().getColaborador());
//				this.venda.adicionarItemVazio();
//				this.produtoLinhaEditavel = null;
//				this.descontoIndividual = BigDecimal.ZERO;
//				this.produto = null;
//				this.venda.recalcularValoresTotais();
//				this.quantidadeTotalProdutos = venda.recalcularQuantidadeProdutosTotal();
//			}
//		}
//	}
//
	public BigDecimal calculaDescontoProduto() {
		BigDecimal novoValor = BigDecimal.ZERO;
		if (venda.isClienteExistente()) { // VERIFICO SE PEDIDO POSSUI CLIENTE INFORMADO
//			if (venda.getCliente().isClasseExistente()) { // VERIFICO SE CLIENTE INFORMADO POSSUI CATEGORIA DE DESCONTO
//															// VINCULADA
//				if ((venda.getCliente().getClasse().getTabelaPreco() != null)
//						&& (venda.getCliente().getClasse().getTabelaPreco().isAtivo())) { // VERIFICO SE CATEGORIA DO
//																							// CLIENTE POSSUI TABELA DE
//																							// PREÇO ATIVA
//					List<TabelaPrecoProduto> produtosTabelaPreco = new ArrayList<>();
//					produtosTabelaPreco = tabelaPrecoProdutos
//							.porTabelaPreco(venda.getCliente().getClasse().getTabelaPreco().getId());
//					for (Iterator<TabelaPrecoProduto> iterator = produtosTabelaPreco.iterator(); iterator.hasNext();) {
//						TabelaPrecoProduto tpp = iterator.next();
//						if (tpp.getProduto().equals(produtoLinhaEditavel)) {
//							novoValor = tpp.getValorUnitario();
//						}
//					}
//				} else {
//					BigDecimal porcentagemDesconto = venda.getCliente().getClasse().getPercentualDesconto()
//							.divide(new BigDecimal(100));
//					BigDecimal desconto = produtoLinhaEditavel.getValorUnitario().multiply(porcentagemDesconto);
//					novoValor = produtoLinhaEditavel.getValorUnitario().subtract(desconto);
//				}
//			}
		}
		return novoValor;
	}

	public void atualizarDescontoItens() {
		if (!venda.getItens().isEmpty()) {// VERIFICO SE PEDIDO POSSUI PRODUTOS ADICIONADOS
			if (venda.isClienteExistente()) {// VERIFICO SE PEDIDO POSSUI CLIENTE INFORMADO
//				if (venda.getCliente().isClasseExistente()) {// VERIFICO SE CLIENTE INFORMADO POSSUI CATEGORIA DE
//																// DESCONTO VINCULADA
//					if ((venda.getCliente().getClasse().getTabelaPreco() != null)
//							&& (venda.getCliente().getClasse().getTabelaPreco().isAtivo())) {// VERIFICO SE CATEGORIA DO
//																								// CLIENTE POSSUI TABELA
//																								// DE PREÇO ATIVA
//						List<TabelaPrecoProduto> produtosTabelaPreco = new ArrayList<>();
//						produtosTabelaPreco = tabelaPrecoProdutos
//								.porTabelaPreco(venda.getCliente().getClasse().getTabelaPreco().getId());
//						// PERCORRO A LISTA DE ITENS ADICIONADOS VERIFICANDO SE NA TABELA DE PREÇOS
//						// PRODUTOS POSSUI OS MESMOS PRODUTOS
//						// CASO ENCONTRE O MESMO PRODUTO PEGO O VALOR DA TABELA E ADICIONA EM VALOR COM
//						// DESCONTO
//						for (VendaItem item : this.getVenda().getItens()) {
//							for (Iterator<TabelaPrecoProduto> iterator = produtosTabelaPreco.iterator(); iterator
//									.hasNext();) {
//								TabelaPrecoProduto tpp = iterator.next();
//								if (item.getProduto().equals(tpp.getProduto())) {
//									item.setValorUnitarioComDesconto(tpp.getValorUnitario());
//								}
//							}
//						}
//						recalcularVenda();
//					} else {
//						BigDecimal porcentagemDesconto = venda.getCliente().getClasse().getPercentualDesconto()
//								.divide(new BigDecimal(100));
//						for (VendaItem item : this.getVenda().getItens()) {
//							BigDecimal desconto = item.getValorUnitarioSemDesconto().multiply(porcentagemDesconto);
//							item.setValorUnitarioComDesconto(item.getValorUnitarioSemDesconto().subtract(desconto));
//						}
//						recalcularVenda();
//					}
//				}
			}
		}

	}

	////////////////////////////////////////////////////////////////////////////////////////
	////////////// TRIBUTAÇÃO DE PRODUTOS - DE OLHO NO IMPOSTO
	//////////////////////////////////////////////////////////////////////////////////////// ////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
//	public BigDecimal calcularTributacaoEstadual() {
//		Ibpt ibpt = ibpts.porCodigo(produtoLinhaEditavel.getNcm().getNcm());
//		BigDecimal porcentagemDesconto = ibpt.getEstadual().divide(new BigDecimal(100));
//		return produtoLinhaEditavel.getValorUnitario().multiply(porcentagemDesconto);
//	}
//
//	public BigDecimal calcularTributacaoFederal() {
//		Ibpt ibpt = ibpts.porCodigo(produtoLinhaEditavel.getNcm().getNcm());
//		BigDecimal porcentagemDesconto = ibpt.getFederalNacional().divide(new BigDecimal(100));
//		return produtoLinhaEditavel.getValorUnitario().multiply(porcentagemDesconto);
//	}
//
//	public BigDecimal calcularTributacaoImportado() {
//		Ibpt ibpt = ibpts.porCodigo(produtoLinhaEditavel.getNcm().getNcm());
//		BigDecimal porcentagemDesconto = ibpt.getFederalImportado().divide(new BigDecimal(100));
//		return produtoLinhaEditavel.getValorUnitario().multiply(porcentagemDesconto);
//	}
//
//	public BigDecimal calcularTributacaoMunicipal() {
//		Ibpt ibpt = ibpts.porCodigo(produtoLinhaEditavel.getNcm().getNcm());
//		BigDecimal porcentagemDesconto = ibpt.getMunicipal().divide(new BigDecimal(100));
//		return produtoLinhaEditavel.getValorUnitario().multiply(porcentagemDesconto);
//	}

	////////////////////////////////////////////////////////////////////////////////////////
	////////////// ATUALIZA QUANTIDADE DO PRODUTO INFORMADO
	//////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
	public void atualizarQuantidade(VendaItem item, int linha) {
		if (item.getQuantidade() < 1) {
			if (linha == 0) {
				item.setQuantidade(1);
			} else {
				this.getVenda().getItens().remove(linha);
			}
		}
		this.venda.recalcularValoresTotais();
		this.quantidadeTotalProdutos = venda.recalcularQuantidadeProdutosTotal();
	}

	////////////////////////////////////////////////////////////////////////////////////////
	////////////// ATUALIZA DESCONTO INDIVIDUAL DO PRODUTO
	//////////////////////////////////////////////////////////////////////////////////////// ESCOLHIDO////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
	public void atualizarDescontoIndividual(int tipo) {
		if (tipo == 0) {
			for (VendaItem item : this.getVenda().getItens()) {
				if (getItemEscolhido().getProduto().equals(item.getProduto())) {
					BigDecimal porcentagemDesconto = getDescontoIndividual().divide(new BigDecimal(100));
					BigDecimal desconto = item.getValorUnitarioSemDesconto().multiply(porcentagemDesconto);
					item.setValorUnitarioComDesconto(item.getValorUnitarioSemDesconto().subtract(desconto));
					break;
				}
			}
		} else if (tipo == 1) {
			for (VendaItem item : this.getVenda().getItens()) {
				if (getItemEscolhido().getProduto().equals(item.getProduto())) {
					item.setValorUnitarioComDesconto(getDescontoIndividual());
					break;
				}
			}

		}
		descontoIndividual = BigDecimal.ZERO;
	}

	public void clienteSelecionado() {
		this.clienteInformado = true;
		//venda.setCpfNfp(venda.getCliente().getCpfCnpj());
		atualizarDescontoItens();
	}

	///////////////////////////////////////////////////////////////////////////////////////
	////////////// ADICIONA FORMA DE PAGAMENTO A VENDA REALIZADA
	/////////////////////////////////////////////////////////////////////////////////////// //////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
//	public void novaFormaPagamento() {
//		this.formaPagamento = new FormaPagamento();
//		this.vendaPagamento = new VendaPagamento();
//		this.vendaPagamentoCartao = new VendaPagamentoCartao();
//	}
//
//	public void adicionarFormaPagamentoDinheiro() {
//		if (vendaPagamento.getValorPagamento().compareTo(BigDecimal.ZERO) != 0) {
//			if (null != vendaPagamento) {
//				venda.getPagamentos().add(vendaPagamento);
//				vendaPagamento.setVenda(venda);
////	                RequestContext.getCurrentInstance().execute("PF('formaPagamentoDinheiro').hide();");
//			}
//			novaFormaPagamento();
//		} else {
//			throw new NegocioException("Valor do Pagamento deve ser informado");
//		}
//	}
//
//	public void adicionarFormaPagamentoCartao() {
//		if (vendaPagamento.getValorPagamento().compareTo(BigDecimal.ZERO) != 0) {
//			if (null != vendaPagamentoCartao) {
//				vendaPagamento.getPagamentosCartao().add(vendaPagamentoCartao);
//				venda.getPagamentos().add(vendaPagamento);
//				vendaPagamentoCartao.setVendaPagamento(vendaPagamento);
//				vendaPagamento.setVenda(venda);
////	                RequestContext.getCurrentInstance().execute("PF('formaPagamentoCartao').hide();");
//			}
//			novaFormaPagamento();
//		} else {
//			throw new NegocioException("Valor do Pagamento deve ser informado");
//		}
//	}
//
//	public void removerFormaPagamento(VendaPagamento vendaPagamento, int linha) {
//		this.getVenda().getPagamentos().remove(linha);
//		novaFormaPagamento();
//	}
//
//	public void escolherForma() {
//		vendaPagamento.setFormaPagamento(formaPagamento);
//	}

	///////////////////////////////////////////////////////////////////////////////////////
	////////////// VERIFICA SE JÁ EXISTE PRODUTO NA VENDA ATUAL
	/////////////////////////////////////////////////////////////////////////////////////// //////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
//	private boolean existeItemComProduto(Produto produto) {
//		boolean existeItem = false;
//		for (VendaItem item : this.getVenda().getItens()) {
//			if (produto.equals(item.getProduto())) {
//				existeItem = true;
//				break;
//			}
//		}
//		return existeItem;
//	}
//
//	public boolean isTipoDescontoInformado() {
//		return venda.isTipoDescontoInformado();
//	}
//
//	//////////// METODO PARA BUSCAR CLIENTES PELO AUTOCOMPLETE
//	//////////// ///////////////////////////////
//	public List<Cliente> completarCliente(String nome) {
//		return clientes.porNome(nome);
//	}
//
//	//////////// METODO PARA BUSCAR PRODUTOS PELO AUTOCOMPLETE
//	//////////// /////////////////////////////////
//	public List<Produto> completarProduto(String nome) {
//		return this.produtos.porNome(nome);
//	}
//
//	public Produto getProdutoLinhaEditavel() {
//		return produtoLinhaEditavel;
//	}
//
//	public void setProdutoLinhaEditavel(Produto produtoLinhaEditavel) {
//		this.produtoLinhaEditavel = produtoLinhaEditavel;
//	}
//
//	public boolean isEditando() {
//		if (this.venda != null) {
//			return venda.getId() != null;
//		}
//		return false;
//	}
//
//	public BigDecimal getValorTotalPago() {
//		BigDecimal valorPago = BigDecimal.ZERO;
//		for (VendaPagamento venda_pagamento : venda.getPagamentos()) {
//			valorPago = valorPago.add(venda_pagamento.getValorPagamento());
//		}
//		return valorPago;
//	}
//
//	public BigDecimal getSaldoPagar() {
//		BigDecimal saldoPagar = BigDecimal.ZERO;
//		if (getValorTotalPago().compareTo(venda.getValorTotal()) <= 0) {
//			saldoPagar = venda.getValorTotal().subtract(venda.getValorDescontoVenda());
//			saldoPagar = saldoPagar.subtract(getValorTotalPago());
//		}
//		return saldoPagar;
//	}
//
//	public BigDecimal getValorTroco() {
//		BigDecimal valorTroco = BigDecimal.ZERO;
//		if (getValorTotalPago().compareTo(venda.getValorTotal()) >= 0) {
//			valorTroco = venda.getValorTotal().subtract(venda.getValorDescontoVenda());
//			valorTroco = valorTroco.subtract(getValorTotalPago());
//		}
//		return valorTroco;
//	}
//
//	public boolean isPagamentoAtingido() {
//		return getValorTotalPago().compareTo(venda.getValorTotal()) >= 0;
//	}
//
//	public Venda getVenda() {
//		return venda;
//	}
//
//	public void setVenda(Venda venda) {
//		if (venda != null) {
//			this.venda = venda;
//		}
//	}

}
