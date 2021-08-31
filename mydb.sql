--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: admin_comments_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_comments_comment (
    id integer NOT NULL,
    object_id character varying(36) NOT NULL,
    "time" timestamp with time zone NOT NULL,
    comment text NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.admin_comments_comment OWNER TO postgres;

--
-- Name: admin_comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_comments_comment_id_seq OWNER TO postgres;

--
-- Name: admin_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_comments_comment_id_seq OWNED BY public.admin_comments_comment.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: lawyers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lawyers (
    lawyer character varying(200) NOT NULL,
    field character varying(200) NOT NULL,
    address character varying(200) NOT NULL,
    city character varying(200) NOT NULL,
    phone integer NOT NULL,
    score integer NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL
);


ALTER TABLE public.lawyers OWNER TO postgres;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    content character varying(2000) NOT NULL,
    lawyer_id character varying(200) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    score double precision NOT NULL,
    update_date timestamp with time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    last_login character varying(32),
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    occupation character varying(50),
    biography character varying(150),
    website character varying(30),
    linkedin character varying(30),
    youtube character varying(30),
    researchgate character varying(30),
    twitter character varying(30),
    facebook character varying(30),
    email character varying(30),
    password character varying(100) NOT NULL,
    country character varying(2),
    photo character varying(30),
    creation_date text,
    is_active boolean NOT NULL,
    is_admin boolean NOT NULL,
    is_staff boolean DEFAULT true
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: admin_comments_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_comments_comment ALTER COLUMN id SET DEFAULT nextval('public.admin_comments_comment_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: admin_comments_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_comments_comment (id, object_id, "time", comment, content_type_id, user_id) FROM stdin;
6	SCP Surreau	2021-08-30 17:05:03.077135+02	sdfsdfh	14	1
7	SCP Surreau	2021-08-30 17:06:08.425662+02	dfgdfgsertertrzt ,tn56112216"'iugutzuygf"yt'ru	14	1
8	SCP Surreau	2021-08-30 18:32:28.8067+02	gdfgdfgdfgdfgsergreser	14	13
9	Gonzalez Avocats	2021-08-31 15:52:06.310309+02	C'est un bon avocat	14	1
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	18	add_logentry
2	Can change log entry	18	change_logentry
3	Can delete log entry	18	delete_logentry
4	Can view log entry	18	view_logentry
5	Can add permission	16	add_permission
6	Can change permission	16	change_permission
7	Can delete permission	16	delete_permission
8	Can view permission	16	view_permission
9	Can add group	17	add_group
10	Can change group	17	change_group
11	Can delete group	17	delete_group
12	Can view group	17	view_group
13	Can add content type	1	add_contenttype
14	Can change content type	1	change_contenttype
15	Can delete content type	1	delete_contenttype
16	Can view content type	1	view_contenttype
17	Can add session	19	add_session
18	Can change session	19	change_session
19	Can delete session	19	delete_session
20	Can view session	19	view_session
21	Can add lawyers	14	add_lawyers
22	Can change lawyers	14	change_lawyers
23	Can delete lawyers	14	delete_lawyers
24	Can view lawyers	14	view_lawyers
25	Can add custom user	15	add_customuser
26	Can change custom user	15	change_customuser
27	Can delete custom user	15	delete_customuser
28	Can view custom user	15	view_customuser
29	Can add review	20	add_review
30	Can change review	20	change_review
31	Can delete review	20	delete_review
32	Can view review	20	view_review
33	Can add comment	21	add_comment
34	Can change comment	21	change_comment
35	Can delete comment	21	delete_comment
36	Can view comment	21	view_comment
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-08-30 14:47:00.952611+02	9	utilistaeur	1	[{"added": {}}]	15	1
2	2021-08-30 14:47:14.200546+02	9	utilistaeur	2	[]	15	1
3	2021-08-30 14:48:00.471218+02	9	utilisateur	2	[{"changed": {"fields": ["Username"]}}]	15	1
4	2021-08-30 17:05:03.079131+02	SCP Surreau	Lawyers object (SCP Surreau)	2	[{"added": {"name": "comment", "object": "2021"}}]	14	1
5	2021-08-30 17:06:08.427663+02	SCP Surreau	Lawyers object (SCP Surreau)	2	[{"added": {"name": "comment", "object": "2021"}}]	14	1
6	2021-08-30 17:07:39.056083+02	9	utilisateur	2	[{"changed": {"fields": ["Is active"]}}]	15	1
7	2021-08-30 17:29:50.706499+02	13	user2	1	[{"added": {}}]	15	1
8	2021-08-30 17:30:12.224845+02	13	user2	2	[{"changed": {"fields": ["Is active"]}}]	15	1
9	2021-08-30 17:37:18.597862+02	13	user2	2	[{"changed": {"fields": ["Is admin"]}}]	15	1
10	2021-08-30 17:37:37.526515+02	13	user2	2	[{"changed": {"fields": ["Is admin"]}}]	15	13
11	2021-08-30 17:43:24.766469+02	8	user	2	[{"changed": {"fields": ["Is active"]}}]	15	1
12	2021-08-30 17:43:30.455615+02	13	user2	2	[{"changed": {"fields": ["Is active"]}}]	15	1
13	2021-08-30 18:07:22.85079+02	13	user2	2	[{"changed": {"fields": ["Is active"]}}]	15	1
14	2021-08-30 18:32:28.809696+02	SCP Surreau	Lawyers object (SCP Surreau)	2	[{"added": {"name": "comment", "object": "2021"}}]	14	13
15	2021-08-30 21:30:45.498158+02	Maitre Truc Muche	Lawyers object (Maitre Truc Muche)	2	[{"changed": {"fields": ["Field"]}}]	14	13
16	2021-08-30 21:48:23.407789+02	Gonzalez Avocats	Lawyers object (Gonzalez Avocats)	2	[{"changed": {"fields": ["Lawyer", "Field", "Address", "Phone"]}}]	14	13
17	2021-08-30 21:49:45.582565+02	Maitre Arnaud Sarrailhé	Lawyers object (Maitre Arnaud Sarrailhé)	2	[{"changed": {"fields": ["Lawyer", "Field", "Address", "Phone"]}}]	14	13
18	2021-08-30 21:52:03.932873+02	Badr MAHBOULI	Lawyers object (Badr MAHBOULI)	2	[{"changed": {"fields": ["Lawyer", "Field", "Address", "Phone", "Score"]}}]	14	13
19	2021-08-30 21:52:18.125563+02	Maitre Truc Muche	Lawyers object (Maitre Truc Muche)	3		14	13
20	2021-08-30 21:52:22.127846+02	Maitre Machin Chouette	Lawyers object (Maitre Machin Chouette)	3		14	13
21	2021-08-31 15:52:06.315305+02	Gonzalez Avocats	Lawyers object (Gonzalez Avocats)	2	[{"added": {"name": "comment", "object": "2021"}}]	14	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	contenttypes	contenttype
14	lawyerfinder	lawyers
15	lawyerfinder	customuser
16	auth	permission
17	auth	group
18	admin	logentry
19	sessions	session
20	lawyerfinder	review
21	admin_comments	comment
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
2	contenttypes	0001_initial	2021-08-23 22:15:54.451228+02
7	contenttypes	0002_remove_content_type_name	2021-08-23 22:17:14.498912+02
8	auth	0001_initial	2021-08-23 22:17:14.501925+02
9	auth	0002_alter_permission_name_max_length	2021-08-23 22:17:14.504928+02
10	auth	0003_alter_user_email_max_length	2021-08-23 22:17:14.508489+02
11	auth	0004_alter_user_username_opts	2021-08-23 22:17:14.511888+02
12	auth	0005_alter_user_last_login_null	2021-08-23 22:17:14.515307+02
13	auth	0006_require_contenttypes_0002	2021-08-23 22:17:14.518717+02
14	auth	0007_alter_validators_add_error_messages	2021-08-23 22:17:14.522053+02
15	auth	0008_alter_user_username_max_length	2021-08-23 22:17:14.526879+02
16	auth	0009_alter_user_last_name_max_length	2021-08-23 22:17:14.529926+02
17	auth	0010_alter_group_name_max_length	2021-08-23 22:17:14.534431+02
18	auth	0011_update_proxy_permissions	2021-08-23 22:17:14.53746+02
19	auth	0012_alter_user_first_name_max_length	2021-08-23 22:17:14.540628+02
20	sessions	0001_initial	2021-08-23 22:17:14.545579+02
21	lawyerfinder	0001_initial	2021-08-29 16:45:56.577252+02
22	admin	0001_initial	2021-08-29 16:45:56.68528+02
23	admin	0002_logentry_remove_auto_add	2021-08-29 16:45:56.696279+02
24	admin	0003_logentry_add_action_flag_choices	2021-08-29 16:45:56.70928+02
25	lawyerfinder	0002_delete_review	2021-08-29 16:45:56.713279+02
26	lawyerfinder	0003_auto_20210829_1645	2021-08-29 16:45:56.760288+02
27	lawyerfinder	0004_auto_20210829_1700	2021-08-29 17:01:17.171916+02
28	admin_comments	0001_initial	2021-08-30 11:54:00.112059+02
29	admin_comments	0002_alter_comment_object_id	2021-08-30 18:10:15.357987+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: lawyers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lawyers (lawyer, field, address, city, phone, score, creation_date, update_date) FROM stdin;
SCP Surreau	Droit Public	2 Rue de Villersexel, 75007 Paris	Paris	142222930	4	2021-08-29 17:01:17.136095+02	2021-08-30 18:32:28.802698+02
Maitre Arnaud Sarrailhé	Droit Pénal	34 Rue de Liège, 75008 Paris	Paris	664764776	4	2021-08-30 21:49:45.581556+02	2021-08-30 21:49:45.581556+02
Badr MAHBOULI	droit des affaires,  droit des contrats et des biens	39 Rue de Châteaudun, 75009 Paris	Paris	189041480	5	2021-08-30 21:52:03.931911+02	2021-08-30 21:52:03.931911+02
Gonzalez Avocats	Droit des étrangers et droit pénal	4 Rue de la Vrillière, 75001 Paris	Paris	180060504	4	2021-08-30 21:48:23.404787+02	2021-08-31 15:52:06.308307+02
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, title, content, lawyer_id, creation_date, score, update_date) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, last_login, username, first_name, last_name, occupation, biography, website, linkedin, youtube, researchgate, twitter, facebook, email, password, country, photo, creation_date, is_active, is_admin, is_staff) FROM stdin;
9	\N	utilisateur	Jean-Michel	Poireau	\N	\N	\N	\N	\N	\N	\N	\N	\N	pbkdf2_sha256$260000$MIiVY2Muqj4UDNdhT2bczQ$i2gJvXqMZS4RA6tKssgAommUh4SCBArxpVPPSLATfak=	\N	\N	\N	t	f	t
8	\N	user	Yasmine	Gmar	\N	\N	\N	\N	\N	\N	\N	\N	\N	pbkdf2_sha256$260000$tooViy1GEEvJRCASFFPKED$66iUQYDA5Rt48YHGjRecF2fdXRmkcWeYaISXGBrlDq8=	\N	\N	\N	f	f	t
13	2021-08-30 16:16:02.558419+00:00	user2	sylvie	Dupond	\N	\N	\N	\N	\N	\N	\N	\N	\N	pbkdf2_sha256$260000$Ghlg41EWn1NpbM0y7RZbzA$YK1X6NThKIqxysPs4otijaHdf28jCskZ/WrQBhx/hVU=	\N	\N	\N	t	f	t
1	2021-08-31 13:51:46.330838+00:00	admin	Yasmine	Gmar	\N	\N	\N	\N	\N	\N	\N	\N	yasminegmar@gmail.com	pbkdf2_sha256$260000$UHvVkeoZyG1xd7DKR2TGyK$kkwCYjjLWBPNMS+QPU62giQC7aPLmCQ8eGAA3IBzdlw=	\N	\N	\N	t	t	t
\.


--
-- Name: admin_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_comments_comment_id_seq', 9, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 21, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 13, true);


--
-- Name: admin_comments_comment admin_comments_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_comments_comment
    ADD CONSTRAINT admin_comments_comment_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: lawyers lawyers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lawyers
    ADD CONSTRAINT lawyers_pkey PRIMARY KEY (lawyer);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: admin_comments_comment_content_type_id_1a113722; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_comments_comment_content_type_id_1a113722 ON public.admin_comments_comment USING btree (content_type_id);


--
-- Name: admin_comments_comment_user_id_b601d5d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_comments_comment_user_id_b601d5d6 ON public.admin_comments_comment USING btree (user_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: reviews_lawyer_id_fb951876; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_lawyer_id_fb951876 ON public.reviews USING btree (lawyer_id);


--
-- Name: reviews_lawyer_id_fb951876_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_lawyer_id_fb951876_like ON public.reviews USING btree (lawyer_id varchar_pattern_ops);


--
-- Name: users_email_0ea73cca_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_email_0ea73cca_like ON public.users USING btree (email varchar_pattern_ops);


--
-- Name: users_username_e8658fc8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_username_e8658fc8_like ON public.users USING btree (username varchar_pattern_ops);


--
-- Name: admin_comments_comment admin_comments_comme_content_type_id_1a113722_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_comments_comment
    ADD CONSTRAINT admin_comments_comme_content_type_id_1a113722_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_comments_comment admin_comments_comment_user_id_b601d5d6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_comments_comment
    ADD CONSTRAINT admin_comments_comment_user_id_b601d5d6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews reviews_lawyer_id_fb951876_fk_lawyers_lawyer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_lawyer_id_fb951876_fk_lawyers_lawyer FOREIGN KEY (lawyer_id) REFERENCES public.lawyers(lawyer) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

