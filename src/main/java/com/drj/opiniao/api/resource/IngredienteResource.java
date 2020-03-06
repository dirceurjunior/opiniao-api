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
import com.drj.opiniao.api.model.Ingrediente;
import com.drj.opiniao.api.repository.Ingredientes;
import com.drj.opiniao.api.service.IngredienteService;

@RestController
@RequestMapping("/ingredientes")
public class IngredienteResource {

	@Autowired
	private Ingredientes ingredientes;

	@Autowired
	private ApplicationEventPublisher publisher;

	@Autowired
	private IngredienteService ingredienteService;

	@Autowired
	private MessageSource messageSource;

	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_INGREDIENTE') and #oauth2.hasScope('read')")
	public Page<Ingrediente> pesquisar(@RequestParam(required = false, defaultValue = "") String nome,
			Pageable pageable) {
		return ingredientes.findByNomeContainingIgnoreCaseOrderByNome(nome, pageable);
	}

	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_INGREDIENTE') and #oauth2.hasScope('write')")
	public ResponseEntity<Ingrediente> criar(@Valid @RequestBody Ingrediente ingrediente,
			HttpServletResponse response) {
		Ingrediente ingredienteSalva = ingredienteService.salvar(ingrediente);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, ingredienteSalva.getId()));
		return ResponseEntity.status(HttpStatus.CREATED).body(ingredienteSalva);
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_INGREDIENTE') and #oauth2.hasScope('read')")
	public ResponseEntity buscarPeloCodigo(@PathVariable Long id) {
		Optional ingrediente = this.ingredientes.findById(id);
		return ingrediente.isPresent() ? ResponseEntity.ok(ingrediente.get()) : ResponseEntity.notFound().build();
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_INGREDIENTE') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Long id) {
		ingredientes.deleteById(id);
	}

	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_INGREDIENTE')")
	public ResponseEntity<Ingrediente> atualizar(@PathVariable Long id, @Valid @RequestBody Ingrediente ingrediente) {
		try {
			Ingrediente ingredienteSalvo = ingredienteService.atualizar(id, ingrediente);
			return ResponseEntity.ok(ingredienteSalvo);
		} catch (IllegalArgumentException e) {
			return ResponseEntity.notFound().build();
		}
	}

}
