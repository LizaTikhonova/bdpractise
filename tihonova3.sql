--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: additional_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE additional_information (
    country_id integer NOT NULL,
    form_id integer NOT NULL,
    religion_id integer NOT NULL,
    currency_id integer NOT NULL,
    administrative_division_id integer NOT NULL
);


ALTER TABLE additional_information OWNER TO postgres;

--
-- Name: additional_information_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE additional_information_2 (
    hdi double precision NOT NULL,
    internet_domain character varying(100) NOT NULL,
    iso character varying(100) NOT NULL,
    mok character varying(100) NOT NULL,
    telephone_code character varying(100) NOT NULL,
    country_id integer NOT NULL,
    CONSTRAINT more_than_zero CHECK ((hdi > (0)::double precision))
);


ALTER TABLE additional_information_2 OWNER TO postgres;

--
-- Name: administrative_division; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE administrative_division (
    name character varying(100) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE administrative_division OWNER TO postgres;

--
-- Name: administrative_division_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE administrative_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative_division_id_seq OWNER TO postgres;

--
-- Name: administrative_division_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE administrative_division_id_seq OWNED BY administrative_division.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    country character varying(100) NOT NULL,
    capital character varying(100) NOT NULL,
    area integer NOT NULL,
    population integer NOT NULL,
    country_id integer NOT NULL,
    CONSTRAINT countries_area_check CHECK ((area > 0)),
    CONSTRAINT countries_population_check CHECK ((population > 0))
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE currency (
    name character varying(100) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE currency OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE currency_id_seq OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE currency_id_seq OWNED BY currency.id;


--
-- Name: editional_information2_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE editional_information2_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE editional_information2_country_id_seq OWNER TO postgres;

--
-- Name: editional_information2_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE editional_information2_country_id_seq OWNED BY additional_information_2.country_id;


--
-- Name: editional_information_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE editional_information_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE editional_information_country_id_seq OWNER TO postgres;

--
-- Name: editional_information_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE editional_information_country_id_seq OWNED BY additional_information.country_id;


--
-- Name: form_of_government; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE form_of_government (
    name character varying(100) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE form_of_government OWNER TO postgres;

--
-- Name: form_of_government_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE form_of_government_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE form_of_government_id_seq OWNER TO postgres;

--
-- Name: form_of_government_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE form_of_government_id_seq OWNED BY form_of_government.id;


--
-- Name: language_in_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE language_in_country (
    country_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE language_in_country OWNER TO postgres;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE languages (
    name character varying(100) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: main_information_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE main_information_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE main_information_id_seq OWNER TO postgres;

--
-- Name: main_information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE main_information_id_seq OWNED BY countries.country_id;


--
-- Name: religions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE religions (
    name character varying(100) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE religions OWNER TO postgres;

--
-- Name: religion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE religion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE religion_id_seq OWNER TO postgres;

--
-- Name: religion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE religion_id_seq OWNED BY religions.id;


--
-- Name: additional_information country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information ALTER COLUMN country_id SET DEFAULT nextval('editional_information_country_id_seq'::regclass);


--
-- Name: additional_information_2 country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information_2 ALTER COLUMN country_id SET DEFAULT nextval('editional_information2_country_id_seq'::regclass);


--
-- Name: administrative_division id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administrative_division ALTER COLUMN id SET DEFAULT nextval('administrative_division_id_seq'::regclass);


--
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN country_id SET DEFAULT nextval('main_information_id_seq'::regclass);


--
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);


--
-- Name: form_of_government id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY form_of_government ALTER COLUMN id SET DEFAULT nextval('form_of_government_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: religions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY religions ALTER COLUMN id SET DEFAULT nextval('religion_id_seq'::regclass);


--
-- Data for Name: additional_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY additional_information (country_id, form_id, religion_id, currency_id, administrative_division_id) FROM stdin;
1	1	1	1	3
2	2	1	2	1
3	3	1	1	2
4	2	2	3	1
5	4	1	4	1
6	5	1	1	2
7	4	3	5	4
\.


--
-- Data for Name: additional_information_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY additional_information_2 (hdi, internet_domain, iso, mok, telephone_code, country_id) FROM stdin;
0.81599999999999995	.pt	PT	POR	+351	1
0.74399999999999999	.br	BR	BRA	+55	2
0.88400000000000001	.es	ES	ESP	+34	3
0.81100000000000005	.ar	AR	ARG	+54	4
0.90200000000000002	.ca	CA	CAN	+1	5
0.88400000000000001	.fr	FR	FRA	+33	6
0.90700000000000003	.uk	GB	GBR	+44	7
\.


--
-- Data for Name: administrative_division; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY administrative_division (name, id) FROM stdin;
unitary state	1
federal state	2
restructuring	3
Great Britan*	4
\.


--
-- Name: administrative_division_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('administrative_division_id_seq', 4, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (country, capital, area, population, country_id) FROM stdin;
Portugal	Lisbon	92151	10799270	1
Brazil	Brasilia	8515770	205737996	2
Spain	Madrid	505990	46468102	3
Argentina	Buenos Aires	2780400	43417000	4
Canada	Ottawa	9984670	36048521	5
France	Paris	674685	66991000	6
Great Britain	London	243809	6395574	7
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY currency (name, id) FROM stdin;
euro	1
brazilian real	2
argentine peso	3
canadian dollar	4
pound sterling	5
\.


--
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('currency_id_seq', 5, true);


--
-- Name: editional_information2_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('editional_information2_country_id_seq', 7, true);


--
-- Name: editional_information_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('editional_information_country_id_seq', 7, true);


--
-- Data for Name: form_of_government; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY form_of_government (name, id) FROM stdin;
parliamentary republic	1
federal presedential republic	2
constitution monarchy	3
parliamentary monarchy	4
semi-presidential system	5
\.


--
-- Name: form_of_government_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('form_of_government_id_seq', 5, true);


--
-- Data for Name: language_in_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY language_in_country (country_id, language_id) FROM stdin;
1	1
1	2
2	1
3	3
4	3
5	4
5	5
6	5
7	4
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY languages (name, id) FROM stdin;
Portuguese	1
Miranda	2
Spanish	3
English	4
French	5
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('languages_id_seq', 5, true);


--
-- Name: main_information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('main_information_id_seq', 7, true);


--
-- Name: religion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('religion_id_seq', 3, true);


--
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY religions (name, id) FROM stdin;
secular state	1
catholicism	2
anglican church	3
\.


--
-- Name: administrative_division administrative_division_administrative_division_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administrative_division
    ADD CONSTRAINT administrative_division_administrative_division_key UNIQUE (name);


--
-- Name: administrative_division administrative_division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administrative_division
    ADD CONSTRAINT administrative_division_pkey PRIMARY KEY (id);


--
-- Name: currency currency_currency_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_currency_key UNIQUE (name);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- Name: additional_information_2 editional_information2_internet_domain_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information_2
    ADD CONSTRAINT editional_information2_internet_domain_key UNIQUE (internet_domain);


--
-- Name: additional_information_2 editional_information2_iso_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information_2
    ADD CONSTRAINT editional_information2_iso_key UNIQUE (iso);


--
-- Name: additional_information_2 editional_information2_mok_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information_2
    ADD CONSTRAINT editional_information2_mok_key UNIQUE (mok);


--
-- Name: additional_information_2 editional_information2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information_2
    ADD CONSTRAINT editional_information2_pkey PRIMARY KEY (country_id);


--
-- Name: additional_information_2 editional_information2_telephone_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information_2
    ADD CONSTRAINT editional_information2_telephone_code_key UNIQUE (telephone_code);


--
-- Name: additional_information editional_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information
    ADD CONSTRAINT editional_information_pkey PRIMARY KEY (country_id);


--
-- Name: form_of_government form_of_government_form_of_government_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY form_of_government
    ADD CONSTRAINT form_of_government_form_of_government_key UNIQUE (name);


--
-- Name: form_of_government form_of_government_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY form_of_government
    ADD CONSTRAINT form_of_government_pkey PRIMARY KEY (id);


--
-- Name: language_in_country language_in_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY language_in_country
    ADD CONSTRAINT language_in_country_pkey PRIMARY KEY (country_id, language_id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: languages langueges_language_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT langueges_language_key UNIQUE (name);


--
-- Name: countries main_information_capital_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT main_information_capital_key UNIQUE (capital);


--
-- Name: countries main_information_country_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT main_information_country_key UNIQUE (country);


--
-- Name: countries main_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT main_information_pkey PRIMARY KEY (country_id);


--
-- Name: religions religion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religion_pkey PRIMARY KEY (id);


--
-- Name: religions religion_religion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religion_religion_key UNIQUE (name);


--
-- Name: additional_information_2 editional_information2_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information_2
    ADD CONSTRAINT editional_information2_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(country_id);


--
-- Name: additional_information editional_information_administrative_division_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information
    ADD CONSTRAINT editional_information_administrative_division_id_fkey FOREIGN KEY (administrative_division_id) REFERENCES administrative_division(id);


--
-- Name: additional_information editional_information_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information
    ADD CONSTRAINT editional_information_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(country_id);


--
-- Name: additional_information editional_information_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information
    ADD CONSTRAINT editional_information_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES currency(id);


--
-- Name: additional_information editional_information_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information
    ADD CONSTRAINT editional_information_form_id_fkey FOREIGN KEY (form_id) REFERENCES form_of_government(id);


--
-- Name: additional_information editional_information_religion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_information
    ADD CONSTRAINT editional_information_religion_id_fkey FOREIGN KEY (religion_id) REFERENCES religions(id);


--
-- Name: language_in_country language_in_country_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY language_in_country
    ADD CONSTRAINT language_in_country_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(country_id);


--
-- Name: language_in_country language_in_country_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY language_in_country
    ADD CONSTRAINT language_in_country_language_id_fkey FOREIGN KEY (language_id) REFERENCES countries(country_id);


--
-- PostgreSQL database dump complete
--

