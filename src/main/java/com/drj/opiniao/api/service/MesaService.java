package com.drj.opiniao.api.service;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.drj.opiniao.api.model.Mesa;
import com.drj.opiniao.api.repository.Mesas;

@Service
public class MesaService {

	@Autowired
	private Mesas mesas;

	public Mesa atualizar(Long id, Mesa mesa) {
		Mesa mesaSalva = buscarMesaPeloCodigo(id);
		BeanUtils.copyProperties(mesa, mesaSalva, "id");
		return mesas.save(mesaSalva);
	}

	private Mesa buscarMesaPeloCodigo(Long id) {
		Mesa mesaSalva = mesas.findById(id).orElseThrow(() -> new EmptyResultDataAccessException(1));
		return mesaSalva;
	}

	public Mesa salvar(@Valid Mesa mesa) {
		return mesas.save(mesa);
	}
}
