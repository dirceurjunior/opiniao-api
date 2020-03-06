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
import com.drj.opiniao.api.model.Unidade;
import com.drj.opiniao.api.repository.Unidades;
import com.drj.opiniao.api.service.UnidadeService;

@RestController
@RequestMapping("/unidades")
public class UnidadeResource {

	@Autowired
	private Unidades unidades;

	@Autowired
	private ApplicationEventPublisher publisher;

	@Autowired
	private UnidadeService unidadeService;

	@Autowired
	private MessageSource messageSource;

	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_PESSOA') and #oauth2.hasScope('read')")
	public Page<Unidade> pesquisar(@RequestParam(required = false, defaultValue = "") String descricao,
			Pageable pageable) {
		return unidades.findByDescricaoContainingIgnoreCaseOrderByDescricao(descricao, pageable);
	}

	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_UNIDADE') and #oauth2.hasScope('write')")
	public ResponseEntity<Unidade> criar(@Valid @RequestBody Unidade unidade, HttpServletResponse response) {
		Unidade unidadeSalva = unidadeService.salvar(unidade);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, unidadeSalva.getId()));
		return ResponseEntity.status(HttpStatus.CREATED).body(unidadeSalva);
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_UNIDADE') and #oauth2.hasScope('read')")
	public ResponseEntity buscarPeloCodigo(@PathVariable Long id) {
		Optional unidade = this.unidades.findById(id);
		return unidade.isPresent() ? ResponseEntity.ok(unidade.get()) : ResponseEntity.notFound().build();
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_UNIDADE') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Long id) {
		unidades.deleteById(id);
	}

	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_LANCAMENTO')")
	public ResponseEntity<Unidade> atualizar(@PathVariable Long id, @Valid @RequestBody Unidade unidade) {
		try {
			Unidade unidadeSalvo = unidadeService.atualizar(id, unidade);
			return ResponseEntity.ok(unidadeSalvo);
		} catch (IllegalArgumentException e) {
			return ResponseEntity.notFound().build();
		}
	}

}
