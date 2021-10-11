package com.drj.opiniao.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.drj.opiniao.api.model.Venda;
import com.drj.opiniao.api.repository.venda.VendasQuery;


//public interface CountryRepository extends JpaRepository<Country,Integer> {
//	
//}
public interface Vendas extends JpaRepository<Venda, Long>, VendasQuery {

}
