
CREATE TABLE public.agenda (
    id bigint NOT NULL,
    data_hora_fim timestamp without time zone NOT NULL,
    data_hora_inicio timestamp without time zone NOT NULL,
    observacao text,
    cliente_id bigint NOT NULL,
    colaborador_id bigint NOT NULL
);


ALTER TABLE public.agenda OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 142760)
-- Name: agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agenda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agenda_id_seq OWNER TO postgres;

--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 186
-- Name: agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agenda_id_seq OWNED BY public.agenda.id;


--
-- TOC entry 187 (class 1259 OID 142762)
-- Name: anexo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.anexo (
    id bigint NOT NULL,
    arquivo oid,
    nome character varying(200) NOT NULL,
    conta_pagar_receber_id bigint
);


ALTER TABLE public.anexo OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 142765)
-- Name: anexo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.anexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anexo_id_seq OWNER TO postgres;

--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 188
-- Name: anexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.anexo_id_seq OWNED BY public.anexo.id;


--
-- TOC entry 189 (class 1259 OID 142767)
-- Name: banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banco (
    id bigint NOT NULL,
    ativo boolean,
    descricao character varying(60) NOT NULL
);


ALTER TABLE public.banco OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 142770)
-- Name: banco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banco_id_seq OWNER TO postgres;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 190
-- Name: banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banco_id_seq OWNED BY public.banco.id;


--
-- TOC entry 191 (class 1259 OID 142772)
-- Name: caixa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caixa (
    id bigint NOT NULL,
    data_abertura timestamp without time zone NOT NULL,
    data_fechamento timestamp without time zone,
    valor_abertura numeric(10,2) NOT NULL,
    valor_fechamento numeric(10,2),
    colaborador_abertura_id bigint NOT NULL,
    colaborador_fechamento_id bigint
);


ALTER TABLE public.caixa OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 142775)
-- Name: caixa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caixa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caixa_id_seq OWNER TO postgres;

--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 192
-- Name: caixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.caixa_id_seq OWNED BY public.caixa.id;


--
-- TOC entry 193 (class 1259 OID 142777)
-- Name: caixa_movimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caixa_movimento (
    id bigint NOT NULL,
    data timestamp without time zone NOT NULL,
    observacao text NOT NULL,
    tipo character varying(255) NOT NULL,
    valor numeric(10,2) NOT NULL,
    caixa_id bigint NOT NULL,
    colaborador_id bigint NOT NULL,
    motivo_id bigint NOT NULL
);


ALTER TABLE public.caixa_movimento OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 142783)
-- Name: caixa_movimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caixa_movimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caixa_movimento_id_seq OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 194
-- Name: caixa_movimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.caixa_movimento_id_seq OWNED BY public.caixa_movimento.id;


--
-- TOC entry 195 (class 1259 OID 142785)
-- Name: cartao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cartao (
    id bigint NOT NULL,
    limiteparcelas integer,
    nome_bandeira character varying(255) NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.cartao OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 142791)
-- Name: cartao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cartao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cartao_id_seq OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 196
-- Name: cartao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cartao_id_seq OWNED BY public.cartao.id;


--
-- TOC entry 197 (class 1259 OID 142793)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id bigint NOT NULL,
    descricao character varying(60) NOT NULL,
    categoria_pai_id bigint
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 142796)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 198
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 199 (class 1259 OID 142798)
-- Name: cest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cest (
    id bigint NOT NULL,
    cest character varying(50) NOT NULL,
    descricao text NOT NULL,
    ncm character varying(50) NOT NULL
);


ALTER TABLE public.cest OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 142804)
-- Name: cest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cest_id_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 200
-- Name: cest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cest_id_seq OWNED BY public.cest.id;


--
-- TOC entry 201 (class 1259 OID 142806)
-- Name: cfop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cfop (
    id bigint NOT NULL,
    cfop character varying(5) NOT NULL,
    descricao text NOT NULL
);


ALTER TABLE public.cfop OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 142812)
-- Name: cfop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cfop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cfop_id_seq OWNER TO postgres;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 202
-- Name: cfop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cfop_id_seq OWNED BY public.cfop.id;


--
-- TOC entry 203 (class 1259 OID 142814)
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classe (
    id bigint NOT NULL,
    descricao character varying(80) NOT NULL,
    percentual_desconto numeric(10,2) NOT NULL,
    tabela_preco_id bigint
);


ALTER TABLE public.classe OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 142817)
-- Name: classe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classe_id_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 204
-- Name: classe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classe_id_seq OWNED BY public.classe.id;


--
-- TOC entry 205 (class 1259 OID 142819)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    cpf_cnpj character varying(20),
    data_cadastro timestamp without time zone NOT NULL,
    data_nascimento timestamp without time zone,
    data_ultima_alteracao timestamp without time zone,
    data_ultima_venda timestamp without time zone,
    naturalidade character varying(100),
    nome_fantasia character varying(200),
    nome_mae character varying(150),
    nome_pai character varying(150),
    nome_razao_social character varying(200) NOT NULL,
    observacao text,
    orgao_emissor character varying(100),
    rg_ie character varying(20),
    tipo_cliente_contrato character varying(255) NOT NULL,
    tipo_estado_civil character varying(255),
    tipo_pessoa character varying(255) NOT NULL,
    tipo_sexo character varying(255),
    tipo_situacao character varying(255) NOT NULL,
    classe_id bigint,
    colaborador_cadastro_id bigint NOT NULL,
    colaborador_responsavel_id bigint,
    colaborador_ultima_alteracao_id bigint
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 142825)
-- Name: cliente_contrato_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_contrato_cliente (
    cliente_id bigint NOT NULL,
    contratoclientes_id bigint NOT NULL
);


ALTER TABLE public.cliente_contrato_cliente OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 142828)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 207
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 208 (class 1259 OID 142830)
-- Name: colaborador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaborador (
    id bigint NOT NULL,
    cor character varying(255),
    cpf character varying(14) NOT NULL,
    data_admissao timestamp without time zone NOT NULL,
    data_desligamento timestamp without time zone,
    nome character varying(250) NOT NULL,
    rg character varying(14) NOT NULL,
    loja_id bigint
);


ALTER TABLE public.colaborador OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 142836)
-- Name: colaborador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colaborador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colaborador_id_seq OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 209
-- Name: colaborador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaborador_id_seq OWNED BY public.colaborador.id;


--
-- TOC entry 210 (class 1259 OID 142838)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    id bigint NOT NULL,
    data_compra timestamp without time zone NOT NULL,
    data_criacao timestamp without time zone NOT NULL,
    data_entrada timestamp without time zone NOT NULL,
    observacao text,
    referencia character varying(10),
    valor_total_com_desconto numeric(10,2) NOT NULL,
    valor_total_sem_desconto numeric(10,2) NOT NULL,
    colaborador_id bigint NOT NULL,
    cliente_id bigint NOT NULL
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 142844)
-- Name: compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_id_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 211
-- Name: compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_id_seq OWNED BY public.compra.id;


--
-- TOC entry 212 (class 1259 OID 142846)
-- Name: compra_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra_item (
    id bigint NOT NULL,
    quantidade integer NOT NULL,
    valor_unitario_com_desconto numeric(10,2) NOT NULL,
    valor_unitario_sem_desconto numeric(10,2) NOT NULL,
    compra_id bigint NOT NULL,
    produto_id bigint NOT NULL
);


ALTER TABLE public.compra_item OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 142849)
-- Name: compra_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_item_id_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 213
-- Name: compra_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_item_id_seq OWNED BY public.compra_item.id;


--
-- TOC entry 214 (class 1259 OID 142851)
-- Name: compra_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra_pagamento (
    id bigint NOT NULL,
    compra_id bigint NOT NULL
);


ALTER TABLE public.compra_pagamento OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 142854)
-- Name: compra_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_pagamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 215
-- Name: compra_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_pagamento_id_seq OWNED BY public.compra_pagamento.id;


--
-- TOC entry 216 (class 1259 OID 142856)
-- Name: conta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conta (
    id bigint NOT NULL,
    agencia character varying(255) NOT NULL,
    descricao character varying(60) NOT NULL,
    numero character varying(255) NOT NULL,
    saldo_inicial numeric(10,2),
    tipo_conta character varying(255) NOT NULL,
    tipo_pessoa character varying(255) NOT NULL,
    banco_id bigint
);


ALTER TABLE public.conta OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 142862)
-- Name: conta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conta_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 217
-- Name: conta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conta_id_seq OWNED BY public.conta.id;


--
-- TOC entry 218 (class 1259 OID 142864)
-- Name: conta_pagar_receber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conta_pagar_receber (
    id bigint NOT NULL,
    data_hora_competencia timestamp without time zone NOT NULL,
    data_hora_lancamento timestamp without time zone NOT NULL,
    data_hora_pagamento timestamp without time zone,
    data_hora_vencimento timestamp without time zone NOT NULL,
    descricao character varying(100),
    liquidado character varying(255) NOT NULL,
    observacao_pagamento text,
    tipo_lancamento character varying(255) NOT NULL,
    valor_desconto numeric(10,2),
    valor_juros numeric(10,2),
    valor_pago numeric(10,2),
    valor_total numeric(10,2) NOT NULL,
    cliente_id bigint,
    conta_id bigint NOT NULL,
    fornecedor_id bigint
);


ALTER TABLE public.conta_pagar_receber OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 142870)
-- Name: conta_pagar_receber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conta_pagar_receber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conta_pagar_receber_id_seq OWNER TO postgres;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 219
-- Name: conta_pagar_receber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conta_pagar_receber_id_seq OWNED BY public.conta_pagar_receber.id;


--
-- TOC entry 220 (class 1259 OID 142872)
-- Name: contato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contato (
    id bigint NOT NULL,
    codigo_area character varying(255) NOT NULL,
    numero character varying(10) NOT NULL,
    observacao character varying(100),
    tipo character varying(255) NOT NULL,
    id_cliente bigint,
    id_colaborador bigint,
    id_fornecedor bigint,
    id_loja bigint
);


ALTER TABLE public.contato OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 142878)
-- Name: contato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contato_id_seq OWNER TO postgres;

--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 221
-- Name: contato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contato_id_seq OWNED BY public.contato.id;


--
-- TOC entry 222 (class 1259 OID 142880)
-- Name: contrato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrato (
    id bigint NOT NULL,
    data_hora_fim timestamp without time zone,
    data_hora_inicio timestamp without time zone NOT NULL,
    data_ultima_alteracao timestamp without time zone,
    dependentes_isentos_pagamento integer,
    local_atendimento character varying(255) NOT NULL,
    numero integer,
    observacao text,
    quantidade_dependentes integer,
    quantidade_parcelas integer,
    periodo character varying(255) NOT NULL,
    situacao character varying(255) NOT NULL,
    valor numeric(10,2),
    valordesconto numeric(10,2),
    cliente_id bigint NOT NULL,
    colaborador_cadastro_id bigint,
    colaborador_ultima_alteracao_id bigint,
    endereco_contrato_id bigint NOT NULL,
    grupo_id bigint NOT NULL,
    plano_id bigint NOT NULL
);


ALTER TABLE public.contrato OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 142886)
-- Name: contrato_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrato_cliente (
    id bigint NOT NULL,
    material_convalescente character varying(255),
    tipo_cliente_contrato character varying(255) NOT NULL,
    parentesco character varying(255),
    cliente bigint,
    contrato bigint
);


ALTER TABLE public.contrato_cliente OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 142892)
-- Name: contrato_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contrato_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contrato_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 224
-- Name: contrato_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contrato_cliente_id_seq OWNED BY public.contrato_cliente.id;


--
-- TOC entry 225 (class 1259 OID 142894)
-- Name: contrato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contrato_id_seq OWNER TO postgres;

--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 225
-- Name: contrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contrato_id_seq OWNED BY public.contrato.id;


--
-- TOC entry 226 (class 1259 OID 142896)
-- Name: csosn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.csosn (
    id bigint NOT NULL,
    classificacao text NOT NULL,
    csosn character varying(255) NOT NULL,
    descricao text NOT NULL,
    tipo_operacao_id bigint NOT NULL
);


ALTER TABLE public.csosn OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 142902)
-- Name: csosn_cst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.csosn_cst (
    csosn_id bigint NOT NULL,
    cst_id bigint NOT NULL
);


ALTER TABLE public.csosn_cst OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 142905)
-- Name: csosn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.csosn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.csosn_id_seq OWNER TO postgres;

--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 228
-- Name: csosn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.csosn_id_seq OWNED BY public.csosn.id;


--
-- TOC entry 229 (class 1259 OID 142907)
-- Name: cst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cst (
    id bigint NOT NULL,
    cst character varying(10) NOT NULL,
    descricao character varying(150) NOT NULL,
    tipo_operacao_venda character varying(10) NOT NULL
);


ALTER TABLE public.cst OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 142910)
-- Name: cst_aliquota_ecf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cst_aliquota_ecf (
    id bigint NOT NULL,
    aliquota_ecf character varying(255) NOT NULL,
    aliquota_icms character varying(255) NOT NULL,
    cst_id bigint
);


ALTER TABLE public.cst_aliquota_ecf OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 142916)
-- Name: cst_aliquota_ecf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cst_aliquota_ecf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cst_aliquota_ecf_id_seq OWNER TO postgres;

--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 231
-- Name: cst_aliquota_ecf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cst_aliquota_ecf_id_seq OWNED BY public.cst_aliquota_ecf.id;


--
-- TOC entry 232 (class 1259 OID 142918)
-- Name: cst_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cst_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cst_id_seq OWNER TO postgres;

--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 232
-- Name: cst_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cst_id_seq OWNED BY public.cst.id;


--
-- TOC entry 233 (class 1259 OID 142920)
-- Name: dependente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dependente (
    id bigint NOT NULL,
    cpf character varying(20),
    data_nascimento timestamp without time zone,
    nome character varying(200) NOT NULL,
    tipo_pessoa character varying(255) NOT NULL,
    id_contrato bigint
);


ALTER TABLE public.dependente OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 142923)
-- Name: dependente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dependente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dependente_id_seq OWNER TO postgres;

--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 234
-- Name: dependente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dependente_id_seq OWNED BY public.dependente.id;


--
-- TOC entry 235 (class 1259 OID 142925)
-- Name: email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    observacao text,
    tipo_email character varying(255) NOT NULL,
    id_cliente bigint,
    id_colaborador bigint,
    id_fornecedor bigint,
    id_loja bigint
);


ALTER TABLE public.email OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 142931)
-- Name: email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_id_seq OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 236
-- Name: email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_id_seq OWNED BY public.email.id;


--
-- TOC entry 237 (class 1259 OID 142933)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    id bigint NOT NULL,
    bairro character varying(150),
    cep character varying(10) NOT NULL,
    complemento character varying(150),
    endereco character varying(150) NOT NULL,
    tipo character varying(255) NOT NULL,
    id_cliente bigint,
    id_colaborador bigint,
    id_fornecedor bigint,
    id_loja bigint,
    id_municipio bigint NOT NULL
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 142939)
-- Name: endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_id_seq OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 238
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;


--
-- TOC entry 239 (class 1259 OID 142941)
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque (
    id bigint NOT NULL,
    data_movimento timestamp without time zone NOT NULL,
    quantidade integer NOT NULL,
    tipo character varying(255) NOT NULL,
    colaborador_id bigint NOT NULL,
    produto_id bigint NOT NULL
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 142944)
-- Name: estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estoque_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estoque_id_seq OWNER TO postgres;

--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 240
-- Name: estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estoque_id_seq OWNED BY public.estoque.id;


--
-- TOC entry 241 (class 1259 OID 142946)
-- Name: forma_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_pagamento (
    id bigint NOT NULL,
    codigo_forma_pagamento_ecf character varying(255) NOT NULL,
    descricao character varying(200) NOT NULL,
    intervalo_dias integer NOT NULL,
    limiteparcelas integer,
    modalidade character varying(255) NOT NULL,
    permite_desconto character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    tipo_forma character varying(255) NOT NULL
);


ALTER TABLE public.forma_pagamento OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 142952)
-- Name: forma_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forma_pagamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forma_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 242
-- Name: forma_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forma_pagamento_id_seq OWNED BY public.forma_pagamento.id;


--
-- TOC entry 243 (class 1259 OID 142954)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    id bigint NOT NULL,
    contato_interno character varying(200),
    cpf_cnpj character varying(20) NOT NULL,
    data_cadastro timestamp without time zone NOT NULL,
    data_ultima_alteracao timestamp without time zone,
    data_ultima_compra timestamp without time zone,
    nome_razao_social character varying(200) NOT NULL,
    notafiscal_ultima_compra bigint,
    rg_ie character varying(20) NOT NULL,
    sac character varying(100),
    sobrenome_nome_fantasia character varying(200) NOT NULL,
    tipo_pessoa character varying(255) NOT NULL,
    tipo_situacao character varying(255) NOT NULL,
    valor_ultima_compra numeric(10,2),
    colaborador_cadastro_id bigint NOT NULL,
    colaborador_ultima_alteracao_id bigint
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 142960)
-- Name: fornecedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedor_id_seq OWNER TO postgres;

--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 244
-- Name: fornecedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedor_id_seq OWNED BY public.fornecedor.id;


--
-- TOC entry 245 (class 1259 OID 142962)
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo (
    id bigint NOT NULL,
    nome character varying(100) NOT NULL,
    numero_final integer NOT NULL,
    numero_inicial integer NOT NULL
);


ALTER TABLE public.grupo OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 142965)
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_id_seq OWNER TO postgres;

--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 246
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;


--
-- TOC entry 247 (class 1259 OID 142967)
-- Name: grupo_vencimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo_vencimento (
    grupo_id bigint NOT NULL,
    vencimento character varying(255) NOT NULL
);


ALTER TABLE public.grupo_vencimento OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 142970)
-- Name: ibpt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ibpt (
    id bigint NOT NULL,
    chave character varying(255),
    codigo character varying(255),
    descricao text,
    estadual numeric(10,2),
    ex character varying(255),
    federal_importado numeric(10,2),
    federal_nacional numeric(10,2),
    fonte character varying(255),
    municipal numeric(10,2),
    tipo character varying(255),
    versao character varying(255),
    vigencia_fim timestamp without time zone NOT NULL,
    vigencia_inicio timestamp without time zone NOT NULL
);


ALTER TABLE public.ibpt OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 142976)
-- Name: ibpt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ibpt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ibpt_id_seq OWNER TO postgres;

--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 249
-- Name: ibpt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ibpt_id_seq OWNED BY public.ibpt.id;


--
-- TOC entry 250 (class 1259 OID 142978)
-- Name: loja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loja (
    id bigint NOT NULL,
    cnpj character varying(20) NOT NULL,
    codigo_loja character varying(255) NOT NULL,
    inscricao_estadual character varying(15) NOT NULL,
    inscricao_municipal character varying(15),
    nome_fantasia character varying(200) NOT NULL,
    razao_social character varying(200) NOT NULL,
    tipo_crt character varying(255) NOT NULL
);


ALTER TABLE public.loja OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 142984)
-- Name: loja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loja_id_seq OWNER TO postgres;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 251
-- Name: loja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loja_id_seq OWNED BY public.loja.id;


--
-- TOC entry 252 (class 1259 OID 142986)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id bigint NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 142989)
-- Name: marca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_id_seq OWNER TO postgres;

--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 253
-- Name: marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marca_id_seq OWNED BY public.marca.id;


--
-- TOC entry 254 (class 1259 OID 142991)
-- Name: motivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.motivo (
    id bigint NOT NULL,
    motivo character varying(200) NOT NULL
);


ALTER TABLE public.motivo OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 142994)
-- Name: motivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.motivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motivo_id_seq OWNER TO postgres;

--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 255
-- Name: motivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.motivo_id_seq OWNED BY public.motivo.id;


--
-- TOC entry 256 (class 1259 OID 142996)
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipio (
    id bigint NOT NULL,
    estado_ibge bigint NOT NULL,
    estado_nome character varying(255) NOT NULL,
    mesorregiao_geografica bigint,
    microrregiao_geografica bigint,
    municipio_codigo bigint NOT NULL,
    municipio_ibge bigint NOT NULL,
    municipio_nome character varying(255) NOT NULL,
    nome_mesorregiao character varying(255),
    nome_microrregiao character varying(255)
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 143002)
-- Name: municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipio_id_seq OWNER TO postgres;

--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 257
-- Name: municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipio_id_seq OWNED BY public.municipio.id;


--
-- TOC entry 258 (class 1259 OID 143004)
-- Name: ncm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ncm (
    id bigint NOT NULL,
    descricao character varying(100) NOT NULL,
    ncm character varying(100) NOT NULL
);


ALTER TABLE public.ncm OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 143007)
-- Name: ncm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ncm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ncm_id_seq OWNER TO postgres;

--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 259
-- Name: ncm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ncm_id_seq OWNED BY public.ncm.id;


--
-- TOC entry 260 (class 1259 OID 143009)
-- Name: obito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obito (
    id bigint NOT NULL,
    data_hora timestamp without time zone NOT NULL,
    cliente_id bigint,
    id_contrato bigint
);


ALTER TABLE public.obito OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 143012)
-- Name: obito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.obito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obito_id_seq OWNER TO postgres;

--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 261
-- Name: obito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.obito_id_seq OWNED BY public.obito.id;


--
-- TOC entry 262 (class 1259 OID 143014)
-- Name: ordem_servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordem_servico (
    id bigint NOT NULL,
    data_hora_abertura timestamp without time zone NOT NULL,
    data_hora_entrega timestamp without time zone,
    data_hora_fechamento timestamp without time zone,
    equipamento character varying(255),
    modelo character varying(255),
    numero bigint NOT NULL,
    numero_patrimonio character varying(255),
    numero_serie character varying(255),
    observacao_interna text,
    problema_apresentado text,
    recebimento_equipamento text,
    servico_prestado text,
    cliente_id bigint NOT NULL,
    colaborador_id bigint NOT NULL,
    endereco_id bigint NOT NULL,
    marca_id bigint,
    status_id bigint NOT NULL
);


ALTER TABLE public.ordem_servico OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 143020)
-- Name: ordem_servico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordem_servico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ordem_servico_id_seq OWNER TO postgres;

--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 263
-- Name: ordem_servico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordem_servico_id_seq OWNED BY public.ordem_servico.id;


--
-- TOC entry 264 (class 1259 OID 143022)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id bigint NOT NULL,
    descricao character varying(80) NOT NULL,
    nome character varying(40) NOT NULL
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 143025)
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_id_seq OWNER TO postgres;

--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 265
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_seq OWNED BY public.perfil.id;


--
-- TOC entry 266 (class 1259 OID 143027)
-- Name: plano; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plano (
    id bigint NOT NULL,
    limite_dependentes integer,
    nome character varying(255) NOT NULL,
    valoranual numeric(10,2) NOT NULL,
    valordependente numeric(10,2) NOT NULL,
    valormensal numeric(10,2) NOT NULL,
    valorsemestral numeric(10,2) NOT NULL,
    valortrimenstal numeric(10,2) NOT NULL
);


ALTER TABLE public.plano OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 143030)
-- Name: plano_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plano_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plano_id_seq OWNER TO postgres;

--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 267
-- Name: plano_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plano_id_seq OWNED BY public.plano.id;


--
-- TOC entry 268 (class 1259 OID 143032)
-- Name: plano_servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plano_servico (
    plano_id bigint NOT NULL,
    servico_id bigint NOT NULL
);


ALTER TABLE public.plano_servico OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 143035)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id bigint NOT NULL,
    caracteristica text,
    codigo_barras character varying(13) NOT NULL,
    data_cadastro timestamp without time zone NOT NULL,
    data_ultima_alteracao timestamp without time zone,
    data_ultima_compra timestamp without time zone,
    data_ultima_venda timestamp without time zone,
    nome character varying(150) NOT NULL,
    quantidade_estoque integer NOT NULL,
    quantidade_maxima integer,
    quantidade_minima integer,
    referencia character varying(50),
    servico character varying(255) NOT NULL,
    tipo_situacao character varying(255) NOT NULL,
    tipo_tamanho character varying(255),
    ultimo_custo numeric(10,2),
    valor_unitario numeric(10,2) NOT NULL,
    categoria_id bigint NOT NULL,
    cest_id bigint,
    colaborador_cadastro_id bigint NOT NULL,
    colaborador_ultima_alteracao_id bigint,
    cst_id bigint NOT NULL,
    cst_aliquota_ecf_id bigint NOT NULL,
    fornecedor_id bigint,
    marca_id bigint,
    ncm_id bigint NOT NULL,
    unidade_id bigint NOT NULL,
    CONSTRAINT produto_quantidade_estoque_check CHECK (((quantidade_estoque <= 9999) AND (quantidade_estoque >= 0))),
    CONSTRAINT produto_quantidade_maxima_check CHECK ((quantidade_maxima >= 1)),
    CONSTRAINT produto_quantidade_minima_check CHECK ((quantidade_minima >= 1))
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 143044)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO postgres;

--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 270
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 271 (class 1259 OID 143046)
-- Name: servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servico (
    id bigint NOT NULL,
    nome character varying(200) NOT NULL,
    tipo_situacao character varying(255) NOT NULL,
    valor_custo numeric(10,2),
    valor_unitario numeric(10,2) NOT NULL,
    colaborador_cadastro_id bigint NOT NULL,
    colaborador_ultima_alteracao_id bigint
);


ALTER TABLE public.servico OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 143049)
-- Name: servico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servico_id_seq OWNER TO postgres;

--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 272
-- Name: servico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servico_id_seq OWNED BY public.servico.id;


--
-- TOC entry 273 (class 1259 OID 143051)
-- Name: status_ordem_servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_ordem_servico (
    id bigint NOT NULL,
    cor character varying(255) NOT NULL,
    sequencia integer,
    status character varying(100) NOT NULL
);


ALTER TABLE public.status_ordem_servico OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 143054)
-- Name: status_ordem_servico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_ordem_servico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_ordem_servico_id_seq OWNER TO postgres;

--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 274
-- Name: status_ordem_servico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_ordem_servico_id_seq OWNED BY public.status_ordem_servico.id;


--
-- TOC entry 275 (class 1259 OID 143056)
-- Name: tabela_preco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tabela_preco (
    id bigint NOT NULL,
    data_inicio timestamp without time zone NOT NULL,
    data_termino timestamp without time zone NOT NULL,
    descricao character varying(100) NOT NULL,
    loja_id bigint
);


ALTER TABLE public.tabela_preco OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 143059)
-- Name: tabela_preco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tabela_preco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tabela_preco_id_seq OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 276
-- Name: tabela_preco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tabela_preco_id_seq OWNED BY public.tabela_preco.id;


--
-- TOC entry 277 (class 1259 OID 143061)
-- Name: tabela_preco_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tabela_preco_produto (
    id bigint NOT NULL,
    valor_unitario numeric(10,2) NOT NULL,
    produto_id bigint NOT NULL,
    tabela_preco_id bigint NOT NULL
);


ALTER TABLE public.tabela_preco_produto OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 143064)
-- Name: tabela_preco_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tabela_preco_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tabela_preco_produto_id_seq OWNER TO postgres;

--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 278
-- Name: tabela_preco_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tabela_preco_produto_id_seq OWNED BY public.tabela_preco_produto.id;


--
-- TOC entry 279 (class 1259 OID 143066)
-- Name: tipo_operacao_fiscal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_operacao_fiscal (
    id bigint NOT NULL,
    cfop_dentro_estado character varying(255) NOT NULL,
    cfop_fora_estado character varying(255) NOT NULL,
    descricao character varying(200) NOT NULL,
    id_operacao_contraria character varying(255) NOT NULL,
    tiponaturezaoperacao character varying(200) NOT NULL,
    tipooperacao character varying(10) NOT NULL
);


ALTER TABLE public.tipo_operacao_fiscal OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 143072)
-- Name: tipo_operacao_fiscal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_operacao_fiscal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_operacao_fiscal_id_seq OWNER TO postgres;

--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 280
-- Name: tipo_operacao_fiscal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_operacao_fiscal_id_seq OWNED BY public.tipo_operacao_fiscal.id;


--
-- TOC entry 281 (class 1259 OID 143074)
-- Name: unidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidade (
    id bigint NOT NULL,
    abreviacao character varying(10) NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.unidade OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 143077)
-- Name: unidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidade_id_seq OWNER TO postgres;

--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 282
-- Name: unidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidade_id_seq OWNED BY public.unidade.id;


--
-- TOC entry 283 (class 1259 OID 143079)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(150) NOT NULL,
    senha character varying(150) NOT NULL,
    tipo_colaborador character varying(255) NOT NULL,
    colaborador_id bigint
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 143085)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 284
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 285 (class 1259 OID 143087)
-- Name: usuario_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_perfil (
    usuario_id bigint NOT NULL,
    perfil_id bigint NOT NULL
);


ALTER TABLE public.usuario_perfil OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 143090)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
    id bigint NOT NULL,
    cpf_nfp character varying(20),
    data_criacao timestamp without time zone NOT NULL,
    data_venda timestamp without time zone,
    observacao text,
    tipo_desconto character varying(255),
    tipo_operacao character varying(255) NOT NULL,
    valor_desconto_venda numeric(10,2),
    valor_total_com_desconto numeric(10,2) NOT NULL,
    valor_total_sem_desconto numeric(10,2) NOT NULL,
    caixa_id bigint,
    cliente_id bigint,
    colaborador_id bigint NOT NULL
);


ALTER TABLE public.venda OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 143096)
-- Name: venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_id_seq OWNER TO postgres;

--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 287
-- Name: venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_id_seq OWNED BY public.venda.id;


--
-- TOC entry 288 (class 1259 OID 143098)
-- Name: venda_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda_item (
    id bigint NOT NULL,
    quantidade integer NOT NULL,
    valor_tributacao_estadual numeric(10,2) NOT NULL,
    valor_tributacao_federal numeric(10,2) NOT NULL,
    valor_tributacao_importado numeric(10,2) NOT NULL,
    valor_tributacao_municipal numeric(10,2) NOT NULL,
    valor_unitario_com_desconto numeric(10,2) NOT NULL,
    valor_unitario_sem_desconto numeric(10,2) NOT NULL,
    colaborador_id bigint NOT NULL,
    produto_id bigint NOT NULL,
    venda_id bigint NOT NULL
);


ALTER TABLE public.venda_item OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 143101)
-- Name: venda_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_item_id_seq OWNER TO postgres;

--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 289
-- Name: venda_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_item_id_seq OWNED BY public.venda_item.id;


--
-- TOC entry 290 (class 1259 OID 143103)
-- Name: venda_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda_pagamento (
    id bigint NOT NULL,
    valor_pagamento numeric(10,2) NOT NULL,
    forma_pagamento_id bigint NOT NULL,
    venda_id bigint NOT NULL
);


ALTER TABLE public.venda_pagamento OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 143106)
-- Name: venda_pagamento_cartao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda_pagamento_cartao (
    id bigint NOT NULL,
    nsu character varying(255),
    quantidadeparcelas integer,
    tipo_cartao_operacao character varying(255) NOT NULL,
    cartao_id bigint NOT NULL,
    venda_pagamento_id bigint NOT NULL
);


ALTER TABLE public.venda_pagamento_cartao OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 143112)
-- Name: venda_pagamento_cartao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_pagamento_cartao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_pagamento_cartao_id_seq OWNER TO postgres;

--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 292
-- Name: venda_pagamento_cartao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_pagamento_cartao_id_seq OWNED BY public.venda_pagamento_cartao.id;


--
-- TOC entry 293 (class 1259 OID 143114)
-- Name: venda_pagamento_cheque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda_pagamento_cheque (
    id bigint NOT NULL,
    agencia character varying(255),
    cheque character varying(255),
    conta character varying(255),
    data_emissao timestamp without time zone,
    data_vencimento timestamp without time zone,
    emitente character varying(255),
    telefone character varying(255),
    valor numeric(10,2),
    banco_id bigint,
    venda_pagamento_id bigint NOT NULL
);


ALTER TABLE public.venda_pagamento_cheque OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 143120)
-- Name: venda_pagamento_cheque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_pagamento_cheque_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_pagamento_cheque_id_seq OWNER TO postgres;

--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 294
-- Name: venda_pagamento_cheque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_pagamento_cheque_id_seq OWNED BY public.venda_pagamento_cheque.id;


--
-- TOC entry 295 (class 1259 OID 143122)
-- Name: venda_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_pagamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 295
-- Name: venda_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_pagamento_id_seq OWNED BY public.venda_pagamento.id;


--
-- TOC entry 296 (class 1259 OID 143124)
-- Name: venda_pagamento_prazo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda_pagamento_prazo (
    id bigint NOT NULL,
    venda_pagamento_id bigint NOT NULL
);


ALTER TABLE public.venda_pagamento_prazo OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 143127)
-- Name: venda_pagamento_prazo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_pagamento_prazo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_pagamento_prazo_id_seq OWNER TO postgres;

--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 297
-- Name: venda_pagamento_prazo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_pagamento_prazo_id_seq OWNED BY public.venda_pagamento_prazo.id;


--
-- TOC entry 2369 (class 2604 OID 143129)
-- Name: agenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda ALTER COLUMN id SET DEFAULT nextval('public.agenda_id_seq'::regclass);


--
-- TOC entry 2370 (class 2604 OID 143130)
-- Name: anexo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anexo ALTER COLUMN id SET DEFAULT nextval('public.anexo_id_seq'::regclass);


--
-- TOC entry 2371 (class 2604 OID 143131)
-- Name: banco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco ALTER COLUMN id SET DEFAULT nextval('public.banco_id_seq'::regclass);


--
-- TOC entry 2372 (class 2604 OID 143132)
-- Name: caixa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caixa ALTER COLUMN id SET DEFAULT nextval('public.caixa_id_seq'::regclass);


--
-- TOC entry 2373 (class 2604 OID 143133)
-- Name: caixa_movimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caixa_movimento ALTER COLUMN id SET DEFAULT nextval('public.caixa_movimento_id_seq'::regclass);


--
-- TOC entry 2374 (class 2604 OID 143134)
-- Name: cartao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartao ALTER COLUMN id SET DEFAULT nextval('public.cartao_id_seq'::regclass);


--
-- TOC entry 2375 (class 2604 OID 143135)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 2376 (class 2604 OID 143136)
-- Name: cest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cest ALTER COLUMN id SET DEFAULT nextval('public.cest_id_seq'::regclass);


--
-- TOC entry 2377 (class 2604 OID 143137)
-- Name: cfop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cfop ALTER COLUMN id SET DEFAULT nextval('public.cfop_id_seq'::regclass);


--
-- TOC entry 2378 (class 2604 OID 143138)
-- Name: classe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe ALTER COLUMN id SET DEFAULT nextval('public.classe_id_seq'::regclass);


--
-- TOC entry 2379 (class 2604 OID 143139)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 2380 (class 2604 OID 143140)
-- Name: colaborador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador ALTER COLUMN id SET DEFAULT nextval('public.colaborador_id_seq'::regclass);


--
-- TOC entry 2381 (class 2604 OID 143141)
-- Name: compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN id SET DEFAULT nextval('public.compra_id_seq'::regclass);


--
-- TOC entry 2382 (class 2604 OID 143142)
-- Name: compra_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra_item ALTER COLUMN id SET DEFAULT nextval('public.compra_item_id_seq'::regclass);


--
-- TOC entry 2383 (class 2604 OID 143143)
-- Name: compra_pagamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra_pagamento ALTER COLUMN id SET DEFAULT nextval('public.compra_pagamento_id_seq'::regclass);


--
-- TOC entry 2384 (class 2604 OID 143144)
-- Name: conta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta ALTER COLUMN id SET DEFAULT nextval('public.conta_id_seq'::regclass);


--
-- TOC entry 2385 (class 2604 OID 143145)
-- Name: conta_pagar_receber id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta_pagar_receber ALTER COLUMN id SET DEFAULT nextval('public.conta_pagar_receber_id_seq'::regclass);


--
-- TOC entry 2386 (class 2604 OID 143146)
-- Name: contato id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contato ALTER COLUMN id SET DEFAULT nextval('public.contato_id_seq'::regclass);


--
-- TOC entry 2387 (class 2604 OID 143147)
-- Name: contrato id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato ALTER COLUMN id SET DEFAULT nextval('public.contrato_id_seq'::regclass);


--
-- TOC entry 2388 (class 2604 OID 143148)
-- Name: contrato_cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_cliente ALTER COLUMN id SET DEFAULT nextval('public.contrato_cliente_id_seq'::regclass);


--
-- TOC entry 2389 (class 2604 OID 143149)
-- Name: csosn id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.csosn ALTER COLUMN id SET DEFAULT nextval('public.csosn_id_seq'::regclass);


--
-- TOC entry 2390 (class 2604 OID 143150)
-- Name: cst id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cst ALTER COLUMN id SET DEFAULT nextval('public.cst_id_seq'::regclass);


--
-- TOC entry 2391 (class 2604 OID 143151)
-- Name: cst_aliquota_ecf id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cst_aliquota_ecf ALTER COLUMN id SET DEFAULT nextval('public.cst_aliquota_ecf_id_seq'::regclass);


--
-- TOC entry 2392 (class 2604 OID 143152)
-- Name: dependente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependente ALTER COLUMN id SET DEFAULT nextval('public.dependente_id_seq'::regclass);


--
-- TOC entry 2393 (class 2604 OID 143153)
-- Name: email id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email ALTER COLUMN id SET DEFAULT nextval('public.email_id_seq'::regclass);


--
-- TOC entry 2394 (class 2604 OID 143154)
-- Name: endereco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);


--
-- TOC entry 2395 (class 2604 OID 143155)
-- Name: estoque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque ALTER COLUMN id SET DEFAULT nextval('public.estoque_id_seq'::regclass);


--
-- TOC entry 2396 (class 2604 OID 143156)
-- Name: forma_pagamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_pagamento ALTER COLUMN id SET DEFAULT nextval('public.forma_pagamento_id_seq'::regclass);


--
-- TOC entry 2397 (class 2604 OID 143157)
-- Name: fornecedor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor ALTER COLUMN id SET DEFAULT nextval('public.fornecedor_id_seq'::regclass);


--
-- TOC entry 2398 (class 2604 OID 143158)
-- Name: grupo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);


--
-- TOC entry 2399 (class 2604 OID 143159)
-- Name: ibpt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ibpt ALTER COLUMN id SET DEFAULT nextval('public.ibpt_id_seq'::regclass);


--
-- TOC entry 2400 (class 2604 OID 143160)
-- Name: loja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loja ALTER COLUMN id SET DEFAULT nextval('public.loja_id_seq'::regclass);


--
-- TOC entry 2401 (class 2604 OID 143161)
-- Name: marca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca ALTER COLUMN id SET DEFAULT nextval('public.marca_id_seq'::regclass);


--
-- TOC entry 2402 (class 2604 OID 143162)
-- Name: motivo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motivo ALTER COLUMN id SET DEFAULT nextval('public.motivo_id_seq'::regclass);


--
-- TOC entry 2403 (class 2604 OID 143163)
-- Name: municipio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio ALTER COLUMN id SET DEFAULT nextval('public.municipio_id_seq'::regclass);


--
-- TOC entry 2404 (class 2604 OID 143164)
-- Name: ncm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ncm ALTER COLUMN id SET DEFAULT nextval('public.ncm_id_seq'::regclass);


--
-- TOC entry 2405 (class 2604 OID 143165)
-- Name: obito id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obito ALTER COLUMN id SET DEFAULT nextval('public.obito_id_seq'::regclass);


--
-- TOC entry 2406 (class 2604 OID 143166)
-- Name: ordem_servico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_servico ALTER COLUMN id SET DEFAULT nextval('public.ordem_servico_id_seq'::regclass);


--
-- TOC entry 2407 (class 2604 OID 143167)
-- Name: perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id SET DEFAULT nextval('public.perfil_id_seq'::regclass);


--
-- TOC entry 2408 (class 2604 OID 143168)
-- Name: plano id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plano ALTER COLUMN id SET DEFAULT nextval('public.plano_id_seq'::regclass);


--
-- TOC entry 2409 (class 2604 OID 143169)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 2413 (class 2604 OID 143170)
-- Name: servico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servico ALTER COLUMN id SET DEFAULT nextval('public.servico_id_seq'::regclass);


--
-- TOC entry 2414 (class 2604 OID 143171)
-- Name: status_ordem_servico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_ordem_servico ALTER COLUMN id SET DEFAULT nextval('public.status_ordem_servico_id_seq'::regclass);


--
-- TOC entry 2415 (class 2604 OID 143172)
-- Name: tabela_preco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabela_preco ALTER COLUMN id SET DEFAULT nextval('public.tabela_preco_id_seq'::regclass);


--
-- TOC entry 2416 (class 2604 OID 143173)
-- Name: tabela_preco_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabela_preco_produto ALTER COLUMN id SET DEFAULT nextval('public.tabela_preco_produto_id_seq'::regclass);


--
-- TOC entry 2417 (class 2604 OID 143174)
-- Name: tipo_operacao_fiscal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_operacao_fiscal ALTER COLUMN id SET DEFAULT nextval('public.tipo_operacao_fiscal_id_seq'::regclass);


--
-- TOC entry 2418 (class 2604 OID 143175)
-- Name: unidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade ALTER COLUMN id SET DEFAULT nextval('public.unidade_id_seq'::regclass);


--
-- TOC entry 2419 (class 2604 OID 143176)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 2420 (class 2604 OID 143177)
-- Name: venda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda ALTER COLUMN id SET DEFAULT nextval('public.venda_id_seq'::regclass);


--
-- TOC entry 2421 (class 2604 OID 143178)
-- Name: venda_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_item ALTER COLUMN id SET DEFAULT nextval('public.venda_item_id_seq'::regclass);


--
-- TOC entry 2422 (class 2604 OID 143179)
-- Name: venda_pagamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_pagamento ALTER COLUMN id SET DEFAULT nextval('public.venda_pagamento_id_seq'::regclass);


--
-- TOC entry 2423 (class 2604 OID 143180)
-- Name: venda_pagamento_cartao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_pagamento_cartao ALTER COLUMN id SET DEFAULT nextval('public.venda_pagamento_cartao_id_seq'::regclass);


--
-- TOC entry 2424 (class 2604 OID 143181)
-- Name: venda_pagamento_cheque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_pagamento_cheque ALTER COLUMN id SET DEFAULT nextval('public.venda_pagamento_cheque_id_seq'::regclass);


--
-- TOC entry 2425 (class 2604 OID 143182)
-- Name: venda_pagamento_prazo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_pagamento_prazo ALTER COLUMN id SET DEFAULT nextval('public.venda_pagamento_prazo_id_seq'::regclass);


--
-- TOC entry 2762 (class 0 OID 142754)
-- Dependencies: 185
-- Data for Name: agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 186
-- Name: agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agenda_id_seq', 1, false);


--
-- TOC entry 2764 (class 0 OID 142762)
-- Dependencies: 187
-- Data for Name: anexo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 188
-- Name: anexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.anexo_id_seq', 1, false);


--
-- TOC entry 2766 (class 0 OID 142767)
-- Dependencies: 189
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 190
-- Name: banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banco_id_seq', 1, false);


--
-- TOC entry 2768 (class 0 OID 142772)
-- Dependencies: 191
-- Data for Name: caixa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 192
-- Name: caixa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.caixa_id_seq', 1, false);


--
-- TOC entry 2770 (class 0 OID 142777)
-- Dependencies: 193
-- Data for Name: caixa_movimento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 194
-- Name: caixa_movimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.caixa_movimento_id_seq', 1, false);


--
-- TOC entry 2772 (class 0 OID 142785)
-- Dependencies: 195
-- Data for Name: cartao; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 196
-- Name: cartao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cartao_id_seq', 1, false);


--
-- TOC entry 2774 (class 0 OID 142793)
-- Dependencies: 197
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 198
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 1, false);


--
-- TOC entry 2776 (class 0 OID 142798)
-- Dependencies: 199
-- Data for Name: cest; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 200
-- Name: cest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cest_id_seq', 1, false);


--
-- TOC entry 2778 (class 0 OID 142806)
-- Dependencies: 201
-- Data for Name: cfop; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 202
-- Name: cfop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cfop_id_seq', 1, false);


--
-- TOC entry 2780 (class 0 OID 142814)
-- Dependencies: 203
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 204
-- Name: classe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classe_id_seq', 1, false);


--
-- TOC entry 2782 (class 0 OID 142819)
-- Dependencies: 205
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--