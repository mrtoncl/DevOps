--
-- PostgreSQL database dump
--

\restrict TGrp6urDGWNfeIzOU5sTJRUa3ZjDsrBwJXiteSiAhCxuTU6maR7lShODZC2LeKN

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: deneme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deneme (
    id integer NOT NULL,
    mesaj text
);


ALTER TABLE public.deneme OWNER TO postgres;

--
-- Name: deneme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deneme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deneme_id_seq OWNER TO postgres;

--
-- Name: deneme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deneme_id_seq OWNED BY public.deneme.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    product_id text NOT NULL,
    ordered_by integer,
    ordered_at timestamp without time zone DEFAULT now() NOT NULL,
    predicted_stockout_day numeric,
    predicted_lead_time_days numeric
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password_hash text NOT NULL,
    full_name text NOT NULL,
    role_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: deneme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deneme ALTER COLUMN id SET DEFAULT nextval('public.deneme_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: deneme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deneme (id, mesaj) FROM stdin;
1	merhaba postgres
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, product_id, ordered_by, ordered_at, predicted_stockout_day, predicted_lead_time_days) FROM stdin;
1	THY-0061	12	2026-07-28 10:12:20.156553	34	66.0743038085861
2	THY-0012	12	2026-07-28 10:12:23.271034	25	56.2366953654598
3	THY-0019	12	2026-07-28 10:12:27.355631	21	38.5624392370524
4	THY-0045	12	2026-07-28 10:12:30.921615	18	34.196497621661
5	THY-0032	12	2026-07-28 10:12:33.823	9	22.2216211264919
6	THY-0041	12	2026-07-28 10:12:38.571843	11	8.09886654859142
7	THY-0050	12	2026-07-28 10:12:41.640574	9	3.12976321921712
8	THY-0022	12	2026-07-28 10:12:44.704823	12	4.0779183305421
9	THY-0053	12	2026-07-28 10:12:47.789586	12	4.00350609549505
10	THY-0024	12	2026-07-28 10:12:50.92199	18	8.61162718743832
11	THY-0055	13	2026-07-28 10:13:59.440358	23	2.15804264934245
12	THY-0056	13	2026-07-28 10:14:02.288583	44	6.99318797523828
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	Admin
2	User
16	Test Rol
17	Test Rol
18	Test Rol
19	Test Rol
20	Test Rol
21	Test Rol
22	Test Rol
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password_hash, full_name, role_id) FROM stdin;
12	murat	$2a$11$FFDuZl7.G64C.bLABsbuauP2fjgV6axX5E5mLxWkzzR2VU9Qhgh8G	Murat Emir Öncül	1
13	yakup	$2a$11$WH3eV.sobNoFCaqY4xJfAOwkb92Hls41671VNbCxaw0AYhk.B29FC	Yakup Özdemir	2
\.


--
-- Name: deneme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deneme_id_seq', 1, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 12, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 22, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: deneme deneme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deneme
    ADD CONSTRAINT deneme_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: orders orders_ordered_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_ordered_by_fkey FOREIGN KEY (ordered_by) REFERENCES public.users(id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

\unrestrict TGrp6urDGWNfeIzOU5sTJRUa3ZjDsrBwJXiteSiAhCxuTU6maR7lShODZC2LeKN

