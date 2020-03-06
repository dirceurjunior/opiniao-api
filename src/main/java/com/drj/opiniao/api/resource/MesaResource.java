package com.drj.opiniao.api.resource;

import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.drj.opiniao.api.event.RecursoCriadoEvent;
import com.drj.opiniao.api.model.Mesa;
import com.drj.opiniao.api.repository.Mesas;
import com.drj.opiniao.api.service.MesaService;

@RestController
@RequestMapping("/mesas")
public class MesaResource {

	@Autowired
	private Mesas mesas;

	@Autowired
	private ApplicationEventPublisher publisher;

	@Autowired
	private MesaService mesaService;

	@Autowired
	private MessageSource messageSource;

	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_MESA') and #oauth2.hasScope('read')")
	public Page<Mesa> pesquisar(@RequestParam(required = false, defaultValue = "") Integer numero, Pageable pageable) {
		return mesas.findAll(pageable); //All(); //ByNumero(numero, pageable); //All(pageable); //dByNumero(numero, pageable);
	}

	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_MESA') and #oauth2.hasScope('write')")
	public ResponseEntity<Mesa> criar(@Valid @RequestBody Mesa mesa, HttpServletResponse response) {
		Mesa mesaSalva = mesaService.salvar(mesa);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, mesaSalva.getId()));
		return ResponseEntity.status(HttpStatus.CREATED).body(mesaSalva);
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_MESA') and #oauth2.hasScope('read')")
	public ResponseEntity buscarPeloCodigo(@PathVariable Long id) {
		Optional mesa = this.mesas.findById(id);
		return mesa.isPresent() ? ResponseEntity.ok(mesa.get()) : ResponseEntity.notFound().build();
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_MESA') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Long id) {
		mesas.deleteById(id);
	}

	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_MESA')")
	public ResponseEntity<Mesa> atualizar(@PathVariable Long id, @Valid @RequestBody Mesa mesa) {
		try {
			Mesa mesaSalvo = mesaService.atualizar(id, mesa);
			return ResponseEntity.ok(mesaSalvo);
		} catch (IllegalArgumentException e) {
			return ResponseEntity.notFound().build();
		}
	}

}
