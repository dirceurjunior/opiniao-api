package com.drj.opiniao.api.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.drj.opiniao.api.en.TipoAtivoInativoBloqueado;
import com.drj.opiniao.api.en.TipoPessoa;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
 *
 * @author Dirceu Junior
 */
@Entity
@Data
public class Cliente implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Size(max = 200)
	@Column(name = "nome_razao_social", nullable = false, length = 200)
	private String nomeRazaoSocial;

	@Size(max = 200)
	@Column(name = "nome_fantasia", length = 200)
	private String nomeFantasia;

	@Column(name = "cpf_cnpj", length = 20)
	private String cpfCnpj;

	@Column(name = "rg_ie", length = 20)
	private String rgInscricaoEstadual;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "pessoa", nullable = false)
	private TipoPessoa pessoa = TipoPessoa.FISICA;

//    @NotNull
//    @Enumerated(EnumType.STRING)
//    @Column(name = "tipo_cliente_contrato", nullable = false)
//    private TipoClienteContrato tipoClienteContrato = TipoClienteContrato.TITULAR;

//	@Enumerated(EnumType.STRING)
//	@Column(name = "tipo_sexo")
//	private TipoSexo tipoSexo;

//	@Enumerated(EnumType.STRING)
//	@Column(name = "tipo_estado_civil")
//	private TipoEstadoCivil tipoEstadoCivil;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "situacao", nullable = false)
	private TipoAtivoInativoBloqueado situacao = TipoAtivoInativoBloqueado.ATIVO;

//	@Column(length = 100)
//	private String naturalidade;
//
//	@Column(name = "orgao_emissor", length = 100)
//	private String orgaoEmissor;
//
//	@Column(name = "data_nascimento")
//	private LocalDateTime dataNascimento;

//	@Column(name = "data_ultima_alteracao")
//	private LocalDateTime dataUltimaAlteracao;
//
//	@Column(name = "data_ultima_venda")
//	private LocalDateTime dataUltimaVenda;

	@NotNull
	@Column(name = "data_cadastro", nullable = false)
	private LocalDateTime dataCadastro;

//	@Column(columnDefinition = "text")
//	private String observacao;

//	@Size(max = 150)
//	@Column(name = "nome_pai", length = 150)
//	private String nomePai;
//
//	@Size(max = 150)
//	@Column(name = "nome_mae", length = 150)
//	private String nomeMae;

//	@NotNull
//	@ManyToOne
//	@JoinColumn(name = "colaborador_cadastro_id")
//	private Colaborador colaboradorCadastro;
//
//	@ManyToOne
//	@JoinColumn(name = "colaborador_ultima_alteracao_id")
//	private Colaborador colaboradorUltimaAlteracao;
//
//	@ManyToOne
//	@JoinColumn(name = "colaborador_responsavel_id")
//	private Colaborador colaboradorResponsavel;
//
//	@OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval = true)
//	private List<Endereco> enderecos = new ArrayList<>();
//
//	@OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval = true)
//	private List<Email> emails = new ArrayList<>();
//
//	@OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval = true)
//	private List<Contato> contatos = new ArrayList<>();

//	@ManyToOne
//	@JoinColumn(name = "classe_id")
//	private Classe classe;

//	@Transient
//	public boolean isNovo() {
//		return getId() == null;
//	}

//	@Transient
//	public boolean isExistente() {
//		return !isNovo();
//	}

//	@Transient
//	public boolean isPessoaFisica() {
//		return TipoPessoa.FISICA.equals(this.getPessoa());
//	}
//
//	@Transient
//	public boolean isPessoaJuridica() {
//		return TipoPessoa.JURIDICA.equals(this.getPessoa());
//	}

//	@Transient
//	public boolean isClasseExistente() {
//		return getClasse() != null;
//	}

}
