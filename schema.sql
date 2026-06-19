--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: approaches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approaches (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.approaches OWNER TO postgres;

--
-- Name: approaches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.approaches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.approaches_id_seq OWNER TO postgres;

--
-- Name: approaches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.approaches_id_seq OWNED BY public.approaches.id;


--
-- Name: case_approaches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_approaches (
    case_id integer NOT NULL,
    approach_id integer NOT NULL
);


ALTER TABLE public.case_approaches OWNER TO postgres;

--
-- Name: case_changetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_changetype (
    case_id integer NOT NULL,
    change_type_id integer NOT NULL
);


ALTER TABLE public.case_changetype OWNER TO postgres;

--
-- Name: case_decisionmethod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_decisionmethod (
    case_id integer NOT NULL,
    decision_method_id integer NOT NULL
);


ALTER TABLE public.case_decisionmethod OWNER TO postgres;

--
-- Name: case_general_issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_general_issues (
    case_id integer NOT NULL,
    general_issue_id integer NOT NULL
);


ALTER TABLE public.case_general_issues OWNER TO postgres;

--
-- Name: case_ifvoting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_ifvoting (
    case_id integer NOT NULL,
    if_voting_id integer NOT NULL
);


ALTER TABLE public.case_ifvoting OWNER TO postgres;

--
-- Name: case_implementerofchange; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_implementerofchange (
    case_id integer NOT NULL,
    implementer_id integer NOT NULL
);


ALTER TABLE public.case_implementerofchange OWNER TO postgres;

--
-- Name: case_insightsoutcomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_insightsoutcomes (
    case_id integer NOT NULL,
    insight_outcome_id integer NOT NULL
);


ALTER TABLE public.case_insightsoutcomes OWNER TO postgres;

--
-- Name: case_method_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_method_types (
    case_id integer NOT NULL,
    method_type_id integer NOT NULL
);


ALTER TABLE public.case_method_types OWNER TO postgres;

--
-- Name: case_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_methods (
    case_id integer NOT NULL,
    method_id integer NOT NULL
);


ALTER TABLE public.case_methods OWNER TO postgres;

--
-- Name: case_organizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_organizations (
    case_id integer NOT NULL,
    organization_id integer NOT NULL
);


ALTER TABLE public.case_organizations OWNER TO postgres;

--
-- Name: case_organizertypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_organizertypes (
    case_id integer NOT NULL,
    organizer_type_id integer NOT NULL
);


ALTER TABLE public.case_organizertypes OWNER TO postgres;

--
-- Name: case_purposes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_purposes (
    case_id integer NOT NULL,
    purpose_id integer NOT NULL
);


ALTER TABLE public.case_purposes OWNER TO postgres;

--
-- Name: case_specific_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_specific_topics (
    case_id integer NOT NULL,
    specific_topic_id integer NOT NULL
);


ALTER TABLE public.case_specific_topics OWNER TO postgres;

--
-- Name: case_targeted_participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_targeted_participants (
    case_id integer NOT NULL,
    targeted_participant_id integer NOT NULL
);


ALTER TABLE public.case_targeted_participants OWNER TO postgres;

--
-- Name: cases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases (
    id integer NOT NULL,
    title text,
    description text,
    city text,
    province text,
    postal_code text,
    country text,
    latitude numeric(10,7),
    longitude numeric(10,7),
    is_component_of_id text,
    specific_methods_tools_techniques_titles text,
    scope_of_influence_1 text,
    start_date date,
    end_date date,
    ongoing text,
    time_limited text,
    public_spectrum text,
    number_of_participants_1 text,
    open_limited text,
    recruitment_method text,
    legality text,
    facilitators text,
    facilitator_training text,
    facetoface_online_or_both text,
    primary_organizer_id integer,
    funder text,
    staff text,
    volunteers text,
    impact_evidence text,
    formal_evaluation text,
    evaluation_reports_count text,
    evaluation_links_count text,
    general_issues text,
    specific_topics text,
    purposes text,
    approaches text,
    targeted_participants text,
    method_types text,
    tools_techniques_types text,
    participants_interactions text,
    learning_resources text,
    decision_methods text,
    if_voting text,
    insights_outcomes text,
    organizer_types text,
    funder_types text,
    change_types text,
    implementers_of_change text,
    section_problems_purpose text,
    section_history_context text,
    section_organizing_funding text,
    section_recruitment_selection text,
    section_methods_tools text,
    section_process_interaction text,
    section_outcomes_effects text,
    section_analysis_lessons text,
    continent character varying(50)
);


ALTER TABLE public.cases OWNER TO postgres;

--
-- Name: cases_dei_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_dei_metrics (
    id bigint,
    cat_gender bigint,
    cat_sexuality bigint,
    cat_race bigint,
    cat_class bigint,
    cat_disability bigint,
    cat_neurodiversity bigint,
    cat_group_age bigint,
    cat_migration bigint,
    cat_territory bigint,
    cat_religion bigint,
    cat_literacy bigint,
    source_cat_gender text,
    source_cat_sexuality text,
    source_cat_race text,
    source_cat_class text,
    source_cat_disability text,
    source_cat_neurodiversity text,
    source_cat_group_age text,
    source_cat_migration text,
    source_cat_territory text,
    source_cat_religion text,
    source_cat_literacy text,
    tipos_interseccionalidad text,
    enfoque_interseccional_explicito bigint
);


ALTER TABLE public.cases_dei_metrics OWNER TO postgres;

--
-- Name: cases_dei_metrics_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_dei_metrics_backup (
    id bigint,
    cat_gender bigint,
    cat_sexuality bigint,
    cat_race bigint,
    cat_class bigint,
    cat_disability bigint,
    cat_neurodiversity bigint,
    cat_group_age bigint,
    cat_migration bigint,
    cat_territory bigint,
    cat_religion bigint,
    cat_literacy bigint,
    source_cat_gender text,
    source_cat_sexuality text,
    source_cat_race text,
    source_cat_class text,
    source_cat_disability text,
    source_cat_neurodiversity text,
    source_cat_group_age text,
    source_cat_migration text,
    source_cat_territory text,
    source_cat_religion text,
    source_cat_literacy text,
    tipos_interseccionalidad text,
    enfoque_interseccional_explicito bigint
);


ALTER TABLE public.cases_dei_metrics_backup OWNER TO postgres;

--
-- Name: cases_equity_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_equity_metrics (
    id bigint,
    cat_equity bigint,
    cat_barriers bigint,
    cat_violence bigint,
    words_cat_equity text,
    words_cat_barriers text,
    words_cat_violence text,
    tipos_interseccionalidad text,
    enfoque_interseccional_explicito bigint
);


ALTER TABLE public.cases_equity_metrics OWNER TO postgres;

--
-- Name: cases_equity_metrics_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_equity_metrics_backup (
    id bigint,
    cat_equity bigint,
    cat_barriers bigint,
    cat_violence bigint,
    words_cat_equity text,
    words_cat_barriers text,
    words_cat_violence text,
    tipos_interseccionalidad text,
    enfoque_interseccional_explicito bigint
);


ALTER TABLE public.cases_equity_metrics_backup OWNER TO postgres;

--
-- Name: cases_llm_classification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_llm_classification (
    id bigint,
    cats_detectadas text,
    llm_clasificacion text
);


ALTER TABLE public.cases_llm_classification OWNER TO postgres;

--
-- Name: cases_llm_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_llm_groups (
    case_id bigint,
    category text,
    group_name text,
    role text
);


ALTER TABLE public.cases_llm_groups OWNER TO postgres;

--
-- Name: cases_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_methods (
    case_id integer NOT NULL,
    method_id integer NOT NULL
);


ALTER TABLE public.cases_methods OWNER TO postgres;

--
-- Name: changetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changetype (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.changetype OWNER TO postgres;

--
-- Name: changetype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.changetype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.changetype_id_seq OWNER TO postgres;

--
-- Name: changetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.changetype_id_seq OWNED BY public.changetype.id;


--
-- Name: decisionmethod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.decisionmethod (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.decisionmethod OWNER TO postgres;

--
-- Name: decisionmethod_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.decisionmethod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.decisionmethod_id_seq OWNER TO postgres;

--
-- Name: decisionmethod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.decisionmethod_id_seq OWNED BY public.decisionmethod.id;


--
-- Name: general_issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.general_issues (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.general_issues OWNER TO postgres;

--
-- Name: general_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.general_issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.general_issues_id_seq OWNER TO postgres;

--
-- Name: general_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.general_issues_id_seq OWNED BY public.general_issues.id;


--
-- Name: ifvoting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ifvoting (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ifvoting OWNER TO postgres;

--
-- Name: ifvoting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ifvoting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ifvoting_id_seq OWNER TO postgres;

--
-- Name: ifvoting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ifvoting_id_seq OWNED BY public.ifvoting.id;


--
-- Name: implementerofchange; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.implementerofchange (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.implementerofchange OWNER TO postgres;

--
-- Name: implementerofchange_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.implementerofchange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.implementerofchange_id_seq OWNER TO postgres;

--
-- Name: implementerofchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.implementerofchange_id_seq OWNED BY public.implementerofchange.id;


--
-- Name: insightsoutcomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insightsoutcomes (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.insightsoutcomes OWNER TO postgres;

--
-- Name: insightsoutcomes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insightsoutcomes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.insightsoutcomes_id_seq OWNER TO postgres;

--
-- Name: insightsoutcomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insightsoutcomes_id_seq OWNED BY public.insightsoutcomes.id;


--
-- Name: method_decisionmethod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.method_decisionmethod (
    method_id integer NOT NULL,
    decision_method_id integer NOT NULL
);


ALTER TABLE public.method_decisionmethod OWNER TO postgres;

--
-- Name: method_ifvoting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.method_ifvoting (
    method_id integer NOT NULL,
    if_voting_id integer NOT NULL
);


ALTER TABLE public.method_ifvoting OWNER TO postgres;

--
-- Name: method_method_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.method_method_types (
    method_id integer NOT NULL,
    method_type_id integer NOT NULL
);


ALTER TABLE public.method_method_types OWNER TO postgres;

--
-- Name: method_purposes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.method_purposes (
    method_id integer NOT NULL,
    purpose_id integer NOT NULL
);


ALTER TABLE public.method_purposes OWNER TO postgres;

--
-- Name: method_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.method_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.method_types OWNER TO postgres;

--
-- Name: method_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.method_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.method_types_id_seq OWNER TO postgres;

--
-- Name: method_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.method_types_id_seq OWNED BY public.method_types.id;


--
-- Name: methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.methods (
    id integer NOT NULL,
    title text,
    description text,
    facilitators text,
    facetoface_online_or_both text,
    public_spectrum text,
    open_limited text,
    recruitment_method text,
    level_polarization text,
    level_complexity text,
    method_types text,
    number_of_participants text,
    scope_of_influence text,
    participants_interactions text,
    decision_methods text,
    if_voting text,
    purpose_method text,
    section_mission_purpose text,
    section_origins_development text,
    section_structure_funding text,
    section_specializations_methods text,
    section_projects_events text,
    section_analysis_lessons text,
    section_publications text
);


ALTER TABLE public.methods OWNER TO postgres;

--
-- Name: organization_general_issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization_general_issues (
    organization_id integer NOT NULL,
    general_issue_id integer NOT NULL
);


ALTER TABLE public.organization_general_issues OWNER TO postgres;

--
-- Name: organization_method_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization_method_types (
    organization_id integer NOT NULL,
    method_type_id integer NOT NULL
);


ALTER TABLE public.organization_method_types OWNER TO postgres;

--
-- Name: organization_specific_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization_specific_topics (
    organization_id integer NOT NULL,
    specific_topic_id integer NOT NULL
);


ALTER TABLE public.organization_specific_topics OWNER TO postgres;

--
-- Name: organizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizations (
    id integer NOT NULL,
    title text,
    description text,
    city text,
    province text,
    postal_code text,
    country text,
    latitude numeric(10,7),
    longitude numeric(10,7),
    sector text,
    specific_methods_tools_techniques text,
    scope_of_influence text,
    type_method text,
    type_tool text,
    specific_topics text,
    general_issues text,
    section_mission_purpose text,
    section_origins_development text,
    section_structure_funding text,
    section_specializations_methods text,
    section_projects_events text,
    section_analysis_lessons text,
    section_publications text
);


ALTER TABLE public.organizations OWNER TO postgres;

--
-- Name: organizertypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizertypes (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.organizertypes OWNER TO postgres;

--
-- Name: organizertypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organizertypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organizertypes_id_seq OWNER TO postgres;

--
-- Name: organizertypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organizertypes_id_seq OWNED BY public.organizertypes.id;


--
-- Name: purposes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purposes (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.purposes OWNER TO postgres;

--
-- Name: purposes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purposes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purposes_id_seq OWNER TO postgres;

--
-- Name: purposes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purposes_id_seq OWNED BY public.purposes.id;


--
-- Name: specific_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specific_topics (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.specific_topics OWNER TO postgres;

--
-- Name: specific_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specific_topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specific_topics_id_seq OWNER TO postgres;

--
-- Name: specific_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specific_topics_id_seq OWNED BY public.specific_topics.id;


--
-- Name: targeted_participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targeted_participants (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.targeted_participants OWNER TO postgres;

--
-- Name: targeted_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targeted_participants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.targeted_participants_id_seq OWNER TO postgres;

--
-- Name: targeted_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targeted_participants_id_seq OWNED BY public.targeted_participants.id;


--
-- Name: approaches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approaches ALTER COLUMN id SET DEFAULT nextval('public.approaches_id_seq'::regclass);


--
-- Name: changetype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changetype ALTER COLUMN id SET DEFAULT nextval('public.changetype_id_seq'::regclass);


--
-- Name: decisionmethod id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decisionmethod ALTER COLUMN id SET DEFAULT nextval('public.decisionmethod_id_seq'::regclass);


--
-- Name: general_issues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_issues ALTER COLUMN id SET DEFAULT nextval('public.general_issues_id_seq'::regclass);


--
-- Name: ifvoting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ifvoting ALTER COLUMN id SET DEFAULT nextval('public.ifvoting_id_seq'::regclass);


--
-- Name: implementerofchange id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.implementerofchange ALTER COLUMN id SET DEFAULT nextval('public.implementerofchange_id_seq'::regclass);


--
-- Name: insightsoutcomes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insightsoutcomes ALTER COLUMN id SET DEFAULT nextval('public.insightsoutcomes_id_seq'::regclass);


--
-- Name: method_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_types ALTER COLUMN id SET DEFAULT nextval('public.method_types_id_seq'::regclass);


--
-- Name: organizertypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizertypes ALTER COLUMN id SET DEFAULT nextval('public.organizertypes_id_seq'::regclass);


--
-- Name: purposes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purposes ALTER COLUMN id SET DEFAULT nextval('public.purposes_id_seq'::regclass);


--
-- Name: specific_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specific_topics ALTER COLUMN id SET DEFAULT nextval('public.specific_topics_id_seq'::regclass);


--
-- Name: targeted_participants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targeted_participants ALTER COLUMN id SET DEFAULT nextval('public.targeted_participants_id_seq'::regclass);


--
-- Name: approaches approaches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approaches
    ADD CONSTRAINT approaches_pkey PRIMARY KEY (id);


--
-- Name: case_approaches case_approaches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_approaches
    ADD CONSTRAINT case_approaches_pkey PRIMARY KEY (case_id, approach_id);


--
-- Name: case_changetype case_changetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_changetype
    ADD CONSTRAINT case_changetype_pkey PRIMARY KEY (case_id, change_type_id);


--
-- Name: case_decisionmethod case_decisionmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_decisionmethod
    ADD CONSTRAINT case_decisionmethod_pkey PRIMARY KEY (case_id, decision_method_id);


--
-- Name: case_general_issues case_general_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_general_issues
    ADD CONSTRAINT case_general_issues_pkey PRIMARY KEY (case_id, general_issue_id);


--
-- Name: case_ifvoting case_ifvoting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_ifvoting
    ADD CONSTRAINT case_ifvoting_pkey PRIMARY KEY (case_id, if_voting_id);


--
-- Name: case_implementerofchange case_implementerofchange_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_implementerofchange
    ADD CONSTRAINT case_implementerofchange_pkey PRIMARY KEY (case_id, implementer_id);


--
-- Name: case_insightsoutcomes case_insightsoutcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_insightsoutcomes
    ADD CONSTRAINT case_insightsoutcomes_pkey PRIMARY KEY (case_id, insight_outcome_id);


--
-- Name: case_method_types case_method_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_method_types
    ADD CONSTRAINT case_method_types_pkey PRIMARY KEY (case_id, method_type_id);


--
-- Name: case_methods case_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_methods
    ADD CONSTRAINT case_methods_pkey PRIMARY KEY (case_id, method_id);


--
-- Name: case_organizations case_organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_organizations
    ADD CONSTRAINT case_organizations_pkey PRIMARY KEY (case_id, organization_id);


--
-- Name: case_organizertypes case_organizertypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_organizertypes
    ADD CONSTRAINT case_organizertypes_pkey PRIMARY KEY (case_id, organizer_type_id);


--
-- Name: case_purposes case_purposes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_purposes
    ADD CONSTRAINT case_purposes_pkey PRIMARY KEY (case_id, purpose_id);


--
-- Name: case_specific_topics case_specific_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_specific_topics
    ADD CONSTRAINT case_specific_topics_pkey PRIMARY KEY (case_id, specific_topic_id);


--
-- Name: case_targeted_participants case_targeted_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_targeted_participants
    ADD CONSTRAINT case_targeted_participants_pkey PRIMARY KEY (case_id, targeted_participant_id);


--
-- Name: cases_methods cases_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_methods
    ADD CONSTRAINT cases_methods_pkey PRIMARY KEY (case_id, method_id);


--
-- Name: cases cases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT cases_pkey PRIMARY KEY (id);


--
-- Name: changetype changetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changetype
    ADD CONSTRAINT changetype_pkey PRIMARY KEY (id);


--
-- Name: decisionmethod decisionmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decisionmethod
    ADD CONSTRAINT decisionmethod_pkey PRIMARY KEY (id);


--
-- Name: general_issues general_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_issues
    ADD CONSTRAINT general_issues_pkey PRIMARY KEY (id);


--
-- Name: ifvoting ifvoting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ifvoting
    ADD CONSTRAINT ifvoting_pkey PRIMARY KEY (id);


--
-- Name: implementerofchange implementerofchange_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.implementerofchange
    ADD CONSTRAINT implementerofchange_pkey PRIMARY KEY (id);


--
-- Name: insightsoutcomes insightsoutcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insightsoutcomes
    ADD CONSTRAINT insightsoutcomes_pkey PRIMARY KEY (id);


--
-- Name: method_decisionmethod method_decisionmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_decisionmethod
    ADD CONSTRAINT method_decisionmethod_pkey PRIMARY KEY (method_id, decision_method_id);


--
-- Name: method_ifvoting method_ifvoting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_ifvoting
    ADD CONSTRAINT method_ifvoting_pkey PRIMARY KEY (method_id, if_voting_id);


--
-- Name: method_method_types method_method_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_method_types
    ADD CONSTRAINT method_method_types_pkey PRIMARY KEY (method_id, method_type_id);


--
-- Name: method_purposes method_purposes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_purposes
    ADD CONSTRAINT method_purposes_pkey PRIMARY KEY (method_id, purpose_id);


--
-- Name: method_types method_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_types
    ADD CONSTRAINT method_types_pkey PRIMARY KEY (id);


--
-- Name: methods methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (id);


--
-- Name: organization_general_issues organization_general_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_general_issues
    ADD CONSTRAINT organization_general_issues_pkey PRIMARY KEY (organization_id, general_issue_id);


--
-- Name: organization_method_types organization_method_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_method_types
    ADD CONSTRAINT organization_method_types_pkey PRIMARY KEY (organization_id, method_type_id);


--
-- Name: organization_specific_topics organization_specific_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_specific_topics
    ADD CONSTRAINT organization_specific_topics_pkey PRIMARY KEY (organization_id, specific_topic_id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: organizertypes organizertypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizertypes
    ADD CONSTRAINT organizertypes_pkey PRIMARY KEY (id);


--
-- Name: purposes purposes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purposes
    ADD CONSTRAINT purposes_pkey PRIMARY KEY (id);


--
-- Name: specific_topics specific_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specific_topics
    ADD CONSTRAINT specific_topics_pkey PRIMARY KEY (id);


--
-- Name: targeted_participants targeted_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targeted_participants
    ADD CONSTRAINT targeted_participants_pkey PRIMARY KEY (id);


--
-- Name: case_approaches case_approaches_approach_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_approaches
    ADD CONSTRAINT case_approaches_approach_id_fkey FOREIGN KEY (approach_id) REFERENCES public.approaches(id) ON DELETE CASCADE;


--
-- Name: case_approaches case_approaches_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_approaches
    ADD CONSTRAINT case_approaches_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_changetype case_changetype_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_changetype
    ADD CONSTRAINT case_changetype_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_changetype case_changetype_change_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_changetype
    ADD CONSTRAINT case_changetype_change_type_id_fkey FOREIGN KEY (change_type_id) REFERENCES public.changetype(id) ON DELETE CASCADE;


--
-- Name: case_decisionmethod case_decisionmethod_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_decisionmethod
    ADD CONSTRAINT case_decisionmethod_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_decisionmethod case_decisionmethod_decision_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_decisionmethod
    ADD CONSTRAINT case_decisionmethod_decision_method_id_fkey FOREIGN KEY (decision_method_id) REFERENCES public.decisionmethod(id) ON DELETE CASCADE;


--
-- Name: case_general_issues case_general_issues_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_general_issues
    ADD CONSTRAINT case_general_issues_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_general_issues case_general_issues_general_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_general_issues
    ADD CONSTRAINT case_general_issues_general_issue_id_fkey FOREIGN KEY (general_issue_id) REFERENCES public.general_issues(id) ON DELETE CASCADE;


--
-- Name: case_ifvoting case_ifvoting_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_ifvoting
    ADD CONSTRAINT case_ifvoting_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_ifvoting case_ifvoting_if_voting_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_ifvoting
    ADD CONSTRAINT case_ifvoting_if_voting_id_fkey FOREIGN KEY (if_voting_id) REFERENCES public.ifvoting(id) ON DELETE CASCADE;


--
-- Name: case_implementerofchange case_implementerofchange_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_implementerofchange
    ADD CONSTRAINT case_implementerofchange_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_implementerofchange case_implementerofchange_implementer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_implementerofchange
    ADD CONSTRAINT case_implementerofchange_implementer_id_fkey FOREIGN KEY (implementer_id) REFERENCES public.implementerofchange(id) ON DELETE CASCADE;


--
-- Name: case_insightsoutcomes case_insightsoutcomes_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_insightsoutcomes
    ADD CONSTRAINT case_insightsoutcomes_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_insightsoutcomes case_insightsoutcomes_insight_outcome_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_insightsoutcomes
    ADD CONSTRAINT case_insightsoutcomes_insight_outcome_id_fkey FOREIGN KEY (insight_outcome_id) REFERENCES public.insightsoutcomes(id) ON DELETE CASCADE;


--
-- Name: case_method_types case_method_types_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_method_types
    ADD CONSTRAINT case_method_types_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_method_types case_method_types_method_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_method_types
    ADD CONSTRAINT case_method_types_method_type_id_fkey FOREIGN KEY (method_type_id) REFERENCES public.method_types(id) ON DELETE CASCADE;


--
-- Name: case_methods case_methods_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_methods
    ADD CONSTRAINT case_methods_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_methods case_methods_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_methods
    ADD CONSTRAINT case_methods_method_id_fkey FOREIGN KEY (method_id) REFERENCES public.methods(id) ON DELETE CASCADE;


--
-- Name: case_organizations case_organizations_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_organizations
    ADD CONSTRAINT case_organizations_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_organizations case_organizations_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_organizations
    ADD CONSTRAINT case_organizations_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: case_organizertypes case_organizertypes_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_organizertypes
    ADD CONSTRAINT case_organizertypes_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_organizertypes case_organizertypes_organizer_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_organizertypes
    ADD CONSTRAINT case_organizertypes_organizer_type_id_fkey FOREIGN KEY (organizer_type_id) REFERENCES public.organizertypes(id) ON DELETE CASCADE;


--
-- Name: case_purposes case_purposes_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_purposes
    ADD CONSTRAINT case_purposes_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_purposes case_purposes_purpose_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_purposes
    ADD CONSTRAINT case_purposes_purpose_id_fkey FOREIGN KEY (purpose_id) REFERENCES public.purposes(id) ON DELETE CASCADE;


--
-- Name: case_specific_topics case_specific_topics_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_specific_topics
    ADD CONSTRAINT case_specific_topics_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_specific_topics case_specific_topics_specific_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_specific_topics
    ADD CONSTRAINT case_specific_topics_specific_topic_id_fkey FOREIGN KEY (specific_topic_id) REFERENCES public.specific_topics(id) ON DELETE CASCADE;


--
-- Name: case_targeted_participants case_targeted_participants_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_targeted_participants
    ADD CONSTRAINT case_targeted_participants_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: case_targeted_participants case_targeted_participants_targeted_participant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_targeted_participants
    ADD CONSTRAINT case_targeted_participants_targeted_participant_id_fkey FOREIGN KEY (targeted_participant_id) REFERENCES public.targeted_participants(id) ON DELETE CASCADE;


--
-- Name: cases fk_cases_organizations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT fk_cases_organizations FOREIGN KEY (primary_organizer_id) REFERENCES public.organizations(id) ON DELETE SET NULL;


--
-- Name: cases_methods fk_link_case; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_methods
    ADD CONSTRAINT fk_link_case FOREIGN KEY (case_id) REFERENCES public.cases(id) ON DELETE CASCADE;


--
-- Name: method_decisionmethod method_decisionmethod_decision_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_decisionmethod
    ADD CONSTRAINT method_decisionmethod_decision_method_id_fkey FOREIGN KEY (decision_method_id) REFERENCES public.decisionmethod(id) ON DELETE CASCADE;


--
-- Name: method_decisionmethod method_decisionmethod_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_decisionmethod
    ADD CONSTRAINT method_decisionmethod_method_id_fkey FOREIGN KEY (method_id) REFERENCES public.methods(id) ON DELETE CASCADE;


--
-- Name: method_ifvoting method_ifvoting_if_voting_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_ifvoting
    ADD CONSTRAINT method_ifvoting_if_voting_id_fkey FOREIGN KEY (if_voting_id) REFERENCES public.ifvoting(id) ON DELETE CASCADE;


--
-- Name: method_ifvoting method_ifvoting_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_ifvoting
    ADD CONSTRAINT method_ifvoting_method_id_fkey FOREIGN KEY (method_id) REFERENCES public.methods(id) ON DELETE CASCADE;


--
-- Name: method_method_types method_method_types_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_method_types
    ADD CONSTRAINT method_method_types_method_id_fkey FOREIGN KEY (method_id) REFERENCES public.methods(id) ON DELETE CASCADE;


--
-- Name: method_method_types method_method_types_method_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_method_types
    ADD CONSTRAINT method_method_types_method_type_id_fkey FOREIGN KEY (method_type_id) REFERENCES public.method_types(id) ON DELETE CASCADE;


--
-- Name: method_purposes method_purposes_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_purposes
    ADD CONSTRAINT method_purposes_method_id_fkey FOREIGN KEY (method_id) REFERENCES public.methods(id) ON DELETE CASCADE;


--
-- Name: method_purposes method_purposes_purpose_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_purposes
    ADD CONSTRAINT method_purposes_purpose_id_fkey FOREIGN KEY (purpose_id) REFERENCES public.purposes(id) ON DELETE CASCADE;


--
-- Name: organization_general_issues organization_general_issues_general_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_general_issues
    ADD CONSTRAINT organization_general_issues_general_issue_id_fkey FOREIGN KEY (general_issue_id) REFERENCES public.general_issues(id) ON DELETE CASCADE;


--
-- Name: organization_general_issues organization_general_issues_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_general_issues
    ADD CONSTRAINT organization_general_issues_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_method_types organization_method_types_method_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_method_types
    ADD CONSTRAINT organization_method_types_method_type_id_fkey FOREIGN KEY (method_type_id) REFERENCES public.method_types(id) ON DELETE CASCADE;


--
-- Name: organization_method_types organization_method_types_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_method_types
    ADD CONSTRAINT organization_method_types_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_specific_topics organization_specific_topics_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_specific_topics
    ADD CONSTRAINT organization_specific_topics_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_specific_topics organization_specific_topics_specific_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_specific_topics
    ADD CONSTRAINT organization_specific_topics_specific_topic_id_fkey FOREIGN KEY (specific_topic_id) REFERENCES public.specific_topics(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

