package com.drj.opiniao.api.service;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.drj.opiniao.api.model.Cliente;
import com.drj.opiniao.api.repository.Clientes;

@Service
public class ClienteService {

	@Autowired
	private Clientes clientes;

	@Autowired
	private ClienteService clienteService;

	public Cliente atualizar(Long id, Cliente cliente) {
		Cliente clienteSalva = buscarClientePeloCodigo(id);

		BeanUtils.copyProperties(cliente, clienteSalva, "id");
		return clientes.save(clienteSalva);
	}

	public void atualizarPropriedadeAtivo(Long id, Boolean ativo) {
		Cliente clienteSalva = buscarClientePeloCodigo(id);
		clientes.save(clienteSalva);
	}

	private Cliente buscarClientePeloCodigo(Long id) {
		Cliente clienteSalva = clientes.findById(id).orElseThrow(() -> new EmptyResultDataAccessException(1));
		return clienteSalva;
	}

	public Cliente salvar(@Valid Cliente cliente) {
		return clientes.save(cliente);
	}
}
