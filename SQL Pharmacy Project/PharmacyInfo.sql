--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 14.9

-- Started on 2023-12-09 11:41:08

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
-- TOC entry 211 (class 1259 OID 17462)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    companyname character varying(24) NOT NULL,
    companyphonenum character varying(16)
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17516)
-- Name: contracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracts (
    context character varying(24) NOT NULL,
    startdate date,
    enddate date,
    supervisorname character(16),
    supervisorphonenum character varying(16),
    pharname character varying(24),
    companyname character varying(24)
);


ALTER TABLE public.contracts OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17457)
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    docssn integer NOT NULL,
    doctorname character(16),
    specialty character varying(24),
    yrsofexp integer
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17474)
-- Name: drugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drugs (
    tradename character varying(24) NOT NULL,
    formula character varying(24),
    companyname character varying(24),
    drugprice numeric(8,2),
    pharname character varying(24)
);


ALTER TABLE public.drugs OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17452)
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    ssn integer NOT NULL,
    fname character(16) NOT NULL,
    lname character(16) NOT NULL,
    addr character varying(32),
    age integer
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17469)
-- Name: pharmacy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pharmacy (
    pharname character varying(24) NOT NULL,
    paddr character varying(32),
    phonenum character varying(16)
);


ALTER TABLE public.pharmacy OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17491)
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriptions (
    presdate date NOT NULL,
    quantity integer NOT NULL,
    tradename character varying(24) NOT NULL,
    ssn integer NOT NULL,
    fname character(16) NOT NULL,
    lname character(16) NOT NULL,
    companyname character varying(24),
    docssn integer
);


ALTER TABLE public.prescriptions OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 17462)
-- Dependencies: 211
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (companyname, companyphonenum) FROM stdin;
MedEx	900-600-8999
Health Corp	902-622-8991
\.


--
-- TOC entry 3360 (class 0 OID 17516)
-- Dependencies: 215
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracts (context, startdate, enddate, supervisorname, supervisorphonenum, pharname, companyname) FROM stdin;
Med+CVS: Advil	2019-12-02	2024-12-02	King            	910-300-4445	CVS	MedEx
Med+Wal: Betaxolol	2019-01-14	2024-01-14	Wilson          	910-440-8912	Walgreens	MedEx
HC+HV: Vicodin	2019-02-02	2024-02-02	Hopkins         	910-566-6588	Hy-Vee	Health Corp
Med+CVS: Pred.	2019-05-05	2024-05-05	Martin          	910-001-3456	CVS	MedEx
\.


--
-- TOC entry 3355 (class 0 OID 17457)
-- Dependencies: 210
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (docssn, doctorname, specialty, yrsofexp) FROM stdin;
6	Charles         	Surgery	10
7	Stevenson       	Cardiology	15
8	Smith           	Surgery	8
\.


--
-- TOC entry 3358 (class 0 OID 17474)
-- Dependencies: 213
-- Data for Name: drugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drugs (tradename, formula, companyname, drugprice, pharname) FROM stdin;
Advil	C13H18O2	MedEx	20.00	CVS
Betaxolol	C18H29NO3	MedEx	10.00	Walgreens
Vicodin	C8H9NO2	Health Corp	20.00	Hy-Vee
Prednisolone	C21H28O5	MedEx	15.00	CVS
\.


--
-- TOC entry 3354 (class 0 OID 17452)
-- Dependencies: 209
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (ssn, fname, lname, addr, age) FROM stdin;
1	Dylan           	Karr            	99 N Apple Lane	24
2	Gretta          	Wood            	909 N Banana Ave	58
3	Jeffery         	Jefferson       	877 E 54th Lane	30
4	Kevin           	Karr            	99 N Apple Lane	21
\.


--
-- TOC entry 3357 (class 0 OID 17469)
-- Dependencies: 212
-- Data for Name: pharmacy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pharmacy (pharname, paddr, phonenum) FROM stdin;
Walgreens	222 S Kiwi Road	900-786-9123
Hy-Vee	434 NW Peach Ave	903-555-0955
CVS	52 NE Night Road	900-555-9090
\.


--
-- TOC entry 3359 (class 0 OID 17491)
-- Dependencies: 214
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescriptions (presdate, quantity, tradename, ssn, fname, lname, companyname, docssn) FROM stdin;
2023-12-08	2	Advil	1	Dylan           	Karr            	MedEx	6
2023-05-18	1	Betaxolol	2	Gretta          	Wood            	MedEx	7
2023-11-12	2	Vicodin	3	Jeffery         	Jefferson       	Health Corp	6
2023-03-06	2	Advil	4	Kevin           	Karr            	MedEx	8
\.


--
-- TOC entry 3192 (class 2606 OID 17468)
-- Name: company company_companyphonenum_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_companyphonenum_key UNIQUE (companyphonenum);


--
-- TOC entry 3194 (class 2606 OID 17466)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (companyname);


--
-- TOC entry 3204 (class 2606 OID 17520)
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (context);


--
-- TOC entry 3206 (class 2606 OID 17522)
-- Name: contracts contracts_supervisorname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_supervisorname_key UNIQUE (supervisorname);


--
-- TOC entry 3190 (class 2606 OID 17461)
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (docssn);


--
-- TOC entry 3198 (class 2606 OID 17480)
-- Name: drugs drugs_formula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs
    ADD CONSTRAINT drugs_formula_key UNIQUE (formula);


--
-- TOC entry 3200 (class 2606 OID 17478)
-- Name: drugs drugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs
    ADD CONSTRAINT drugs_pkey PRIMARY KEY (tradename);


--
-- TOC entry 3188 (class 2606 OID 17456)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (ssn, fname, lname);


--
-- TOC entry 3196 (class 2606 OID 17473)
-- Name: pharmacy pharmacy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacy
    ADD CONSTRAINT pharmacy_pkey PRIMARY KEY (pharname);


--
-- TOC entry 3202 (class 2606 OID 17495)
-- Name: prescriptions prescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_pkey PRIMARY KEY (presdate, quantity, tradename, ssn, fname, lname);


--
-- TOC entry 3214 (class 2606 OID 17528)
-- Name: contracts contracts_companyname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_companyname_fkey FOREIGN KEY (companyname) REFERENCES public.company(companyname) ON DELETE CASCADE;


--
-- TOC entry 3213 (class 2606 OID 17523)
-- Name: contracts contracts_pharname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pharname_fkey FOREIGN KEY (pharname) REFERENCES public.pharmacy(pharname);


--
-- TOC entry 3207 (class 2606 OID 17481)
-- Name: drugs drugs_companyname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs
    ADD CONSTRAINT drugs_companyname_fkey FOREIGN KEY (companyname) REFERENCES public.company(companyname) ON DELETE CASCADE;


--
-- TOC entry 3208 (class 2606 OID 17486)
-- Name: drugs drugs_pharname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs
    ADD CONSTRAINT drugs_pharname_fkey FOREIGN KEY (pharname) REFERENCES public.pharmacy(pharname);


--
-- TOC entry 3210 (class 2606 OID 17501)
-- Name: prescriptions prescriptions_companyname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_companyname_fkey FOREIGN KEY (companyname) REFERENCES public.company(companyname) ON DELETE CASCADE;


--
-- TOC entry 3209 (class 2606 OID 17496)
-- Name: prescriptions prescriptions_docssn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_docssn_fkey FOREIGN KEY (docssn) REFERENCES public.doctors(docssn);


--
-- TOC entry 3211 (class 2606 OID 17506)
-- Name: prescriptions prescriptions_ssn_fname_lname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_ssn_fname_lname_fkey FOREIGN KEY (ssn, fname, lname) REFERENCES public.patients(ssn, fname, lname);


--
-- TOC entry 3212 (class 2606 OID 17511)
-- Name: prescriptions prescriptions_tradename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_tradename_fkey FOREIGN KEY (tradename) REFERENCES public.drugs(tradename);


-- Completed on 2023-12-09 11:41:08

--
-- PostgreSQL database dump complete
--

