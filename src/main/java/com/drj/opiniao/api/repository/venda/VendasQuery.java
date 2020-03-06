package com.drj.opiniao.api.repository.venda;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.drj.opiniao.api.model.Venda;
import com.drj.opiniao.api.repository.filter.VendaFilter;
import com.drj.opiniao.api.repository.projection.ResumoVenda;

public interface VendasQuery {

	public Page<Venda> filtrar(VendaFilter vendaFilter, Pageable pageable);

	public Page<ResumoVenda> resumir(VendaFilter vendaFilter, Pageable pageable);

}
