toc.dat                                                                                             0000600 0004000 0002000 00000034523 14634714107 0014455 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   #    /                |            triva    16.2 (Debian 16.2-1.pgdg120+2)    16.2 (Debian 16.2-1.pgdg120+2) 1    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         W           1262    16384    triva    DATABASE     p   CREATE DATABASE triva WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE triva;
                habi    false         �            1259    16484    quiz    TABLE       CREATE TABLE public.quiz (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);
    DROP TABLE public.quiz;
       public         heap    habi    false         �            1259    16519    quiz_choice    TABLE     A  CREATE TABLE public.quiz_choice (
    id integer NOT NULL,
    question_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_correct boolean,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);
    DROP TABLE public.quiz_choice;
       public         heap    habi    false         �            1259    16517    quiz_choice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_choice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.quiz_choice_id_seq;
       public          habi    false    225         X           0    0    quiz_choice_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.quiz_choice_id_seq OWNED BY public.quiz_choice.id;
          public          habi    false    223         �            1259    16518    quiz_choice_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_choice_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.quiz_choice_question_id_seq;
       public          habi    false    225         Y           0    0    quiz_choice_question_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.quiz_choice_question_id_seq OWNED BY public.quiz_choice.question_id;
          public          habi    false    224         �            1259    16482    quiz_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.quiz_id_seq;
       public          habi    false    219         Z           0    0    quiz_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.quiz_id_seq OWNED BY public.quiz.id;
          public          habi    false    217         �            1259    16500    quiz_question    TABLE     �  CREATE TABLE public.quiz_question (
    id integer NOT NULL,
    quiz_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_use_image boolean,
    image_url character varying(255) DEFAULT ''::character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);
 !   DROP TABLE public.quiz_question;
       public         heap    habi    false         �            1259    16498    quiz_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.quiz_question_id_seq;
       public          habi    false    222         [           0    0    quiz_question_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.quiz_question_id_seq OWNED BY public.quiz_question.id;
          public          habi    false    220         �            1259    16499    quiz_question_quiz_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_question_quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.quiz_question_quiz_id_seq;
       public          habi    false    222         \           0    0    quiz_question_quiz_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.quiz_question_quiz_id_seq OWNED BY public.quiz_question.quiz_id;
          public          habi    false    221         �            1259    16483    quiz_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.quiz_user_id_seq;
       public          habi    false    219         ]           0    0    quiz_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.quiz_user_id_seq OWNED BY public.quiz.user_id;
          public          habi    false    218         �            1259    16464    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    full_name character varying(255) NOT NULL,
    email character varying(100),
    password character varying(100) NOT NULL,
    avatar_url character varying(255) DEFAULT '/img/avatars/default.png'::character varying NOT NULL,
    google_id character varying(255) DEFAULT ''::character varying,
    facebook_id character varying(255) DEFAULT ''::character varying,
    github_id character varying(255) DEFAULT ''::character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    habi    false         �            1259    16463    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          habi    false    216         ^           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          habi    false    215         �           2604    16487    quiz id    DEFAULT     b   ALTER TABLE ONLY public.quiz ALTER COLUMN id SET DEFAULT nextval('public.quiz_id_seq'::regclass);
 6   ALTER TABLE public.quiz ALTER COLUMN id DROP DEFAULT;
       public          habi    false    217    219    219         �           2604    16488    quiz user_id    DEFAULT     l   ALTER TABLE ONLY public.quiz ALTER COLUMN user_id SET DEFAULT nextval('public.quiz_user_id_seq'::regclass);
 ;   ALTER TABLE public.quiz ALTER COLUMN user_id DROP DEFAULT;
       public          habi    false    219    218    219         �           2604    16522    quiz_choice id    DEFAULT     p   ALTER TABLE ONLY public.quiz_choice ALTER COLUMN id SET DEFAULT nextval('public.quiz_choice_id_seq'::regclass);
 =   ALTER TABLE public.quiz_choice ALTER COLUMN id DROP DEFAULT;
       public          habi    false    225    223    225         �           2604    16523    quiz_choice question_id    DEFAULT     �   ALTER TABLE ONLY public.quiz_choice ALTER COLUMN question_id SET DEFAULT nextval('public.quiz_choice_question_id_seq'::regclass);
 F   ALTER TABLE public.quiz_choice ALTER COLUMN question_id DROP DEFAULT;
       public          habi    false    224    225    225         �           2604    16503    quiz_question id    DEFAULT     t   ALTER TABLE ONLY public.quiz_question ALTER COLUMN id SET DEFAULT nextval('public.quiz_question_id_seq'::regclass);
 ?   ALTER TABLE public.quiz_question ALTER COLUMN id DROP DEFAULT;
       public          habi    false    220    222    222         �           2604    16504    quiz_question quiz_id    DEFAULT     ~   ALTER TABLE ONLY public.quiz_question ALTER COLUMN quiz_id SET DEFAULT nextval('public.quiz_question_quiz_id_seq'::regclass);
 D   ALTER TABLE public.quiz_question ALTER COLUMN quiz_id DROP DEFAULT;
       public          habi    false    221    222    222         �           2604    16467    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          habi    false    215    216    216         K          0    16484    quiz 
   TABLE DATA           U   COPY public.quiz (id, name, user_id, created_at, updated_at, deleted_at) FROM stdin;
    public          habi    false    219       3403.dat Q          0    16519    quiz_choice 
   TABLE DATA           l   COPY public.quiz_choice (id, question_id, name, is_correct, created_at, updated_at, deleted_at) FROM stdin;
    public          habi    false    225       3409.dat N          0    16500    quiz_question 
   TABLE DATA           w   COPY public.quiz_question (id, quiz_id, name, is_use_image, image_url, created_at, updated_at, deleted_at) FROM stdin;
    public          habi    false    222       3406.dat H          0    16464    users 
   TABLE DATA           �   COPY public.users (id, username, full_name, email, password, avatar_url, google_id, facebook_id, github_id, created_at, updated_at, deleted_at) FROM stdin;
    public          habi    false    216       3400.dat _           0    0    quiz_choice_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.quiz_choice_id_seq', 1, false);
          public          habi    false    223         `           0    0    quiz_choice_question_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.quiz_choice_question_id_seq', 1, false);
          public          habi    false    224         a           0    0    quiz_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.quiz_id_seq', 1, true);
          public          habi    false    217         b           0    0    quiz_question_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.quiz_question_id_seq', 1, false);
          public          habi    false    220         c           0    0    quiz_question_quiz_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.quiz_question_quiz_id_seq', 1, false);
          public          habi    false    221         d           0    0    quiz_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.quiz_user_id_seq', 1, false);
          public          habi    false    218         e           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 6, true);
          public          habi    false    215         �           2606    16527    quiz_choice quiz_choice_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.quiz_choice
    ADD CONSTRAINT quiz_choice_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.quiz_choice DROP CONSTRAINT quiz_choice_pkey;
       public            habi    false    225         �           2606    16492    quiz quiz_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.quiz DROP CONSTRAINT quiz_pkey;
       public            habi    false    219         �           2606    16511     quiz_question quiz_question_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.quiz_question DROP CONSTRAINT quiz_question_pkey;
       public            habi    false    222         �           2606    16481    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            habi    false    216         �           2606    16477    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            habi    false    216         �           2606    16479    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            habi    false    216         �           2606    16528 (   quiz_choice quiz_choice_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_choice
    ADD CONSTRAINT quiz_choice_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.quiz_question(id);
 R   ALTER TABLE ONLY public.quiz_choice DROP CONSTRAINT quiz_choice_question_id_fkey;
       public          habi    false    3250    225    222         �           2606    16512 (   quiz_question quiz_question_quiz_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);
 R   ALTER TABLE ONLY public.quiz_question DROP CONSTRAINT quiz_question_quiz_id_fkey;
       public          habi    false    219    3248    222         �           2606    16493    quiz quiz_user_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.quiz DROP CONSTRAINT quiz_user_id_fkey;
       public          habi    false    3244    216    219                                                                                                                                                                                     3403.dat                                                                                            0000600 0004000 0002000 00000000111 14634714107 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Halloo?	6	2024-06-13 22:38:51.58442	2024-06-13 22:38:51.584423	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                       3409.dat                                                                                            0000600 0004000 0002000 00000000005 14634714107 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3406.dat                                                                                            0000600 0004000 0002000 00000000005 14634714107 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3400.dat                                                                                            0000600 0004000 0002000 00000000311 14634714107 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	doni123	Lalu Doni Setiawan	laludoni123@gmail.com	$2a$10$6PYsmy3KX5qs02Dzv6NzFO7.qlgbLPNo7cGqxEx1Rrk4Xlqh/LJYC	/img/avatars/default.png				2024-06-13 22:06:27.54884	2024-06-13 22:06:27.548843	\N
\.


                                                                                                                                                                                                                                                                                                                       restore.sql                                                                                         0000600 0004000 0002000 00000027461 14634714107 0015405 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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

DROP DATABASE triva;
--
-- Name: triva; Type: DATABASE; Schema: -; Owner: habi
--

CREATE DATABASE triva WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE triva OWNER TO habi;

\connect triva

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
-- Name: quiz; Type: TABLE; Schema: public; Owner: habi
--

CREATE TABLE public.quiz (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);


ALTER TABLE public.quiz OWNER TO habi;

--
-- Name: quiz_choice; Type: TABLE; Schema: public; Owner: habi
--

CREATE TABLE public.quiz_choice (
    id integer NOT NULL,
    question_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_correct boolean,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);


ALTER TABLE public.quiz_choice OWNER TO habi;

--
-- Name: quiz_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: habi
--

CREATE SEQUENCE public.quiz_choice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_choice_id_seq OWNER TO habi;

--
-- Name: quiz_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: habi
--

ALTER SEQUENCE public.quiz_choice_id_seq OWNED BY public.quiz_choice.id;


--
-- Name: quiz_choice_question_id_seq; Type: SEQUENCE; Schema: public; Owner: habi
--

CREATE SEQUENCE public.quiz_choice_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_choice_question_id_seq OWNER TO habi;

--
-- Name: quiz_choice_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: habi
--

ALTER SEQUENCE public.quiz_choice_question_id_seq OWNED BY public.quiz_choice.question_id;


--
-- Name: quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: habi
--

CREATE SEQUENCE public.quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_id_seq OWNER TO habi;

--
-- Name: quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: habi
--

ALTER SEQUENCE public.quiz_id_seq OWNED BY public.quiz.id;


--
-- Name: quiz_question; Type: TABLE; Schema: public; Owner: habi
--

CREATE TABLE public.quiz_question (
    id integer NOT NULL,
    quiz_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_use_image boolean,
    image_url character varying(255) DEFAULT ''::character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);


ALTER TABLE public.quiz_question OWNER TO habi;

--
-- Name: quiz_question_id_seq; Type: SEQUENCE; Schema: public; Owner: habi
--

CREATE SEQUENCE public.quiz_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_question_id_seq OWNER TO habi;

--
-- Name: quiz_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: habi
--

ALTER SEQUENCE public.quiz_question_id_seq OWNED BY public.quiz_question.id;


--
-- Name: quiz_question_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: habi
--

CREATE SEQUENCE public.quiz_question_quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_question_quiz_id_seq OWNER TO habi;

--
-- Name: quiz_question_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: habi
--

ALTER SEQUENCE public.quiz_question_quiz_id_seq OWNED BY public.quiz_question.quiz_id;


--
-- Name: quiz_user_id_seq; Type: SEQUENCE; Schema: public; Owner: habi
--

CREATE SEQUENCE public.quiz_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_user_id_seq OWNER TO habi;

--
-- Name: quiz_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: habi
--

ALTER SEQUENCE public.quiz_user_id_seq OWNED BY public.quiz.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: habi
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    full_name character varying(255) NOT NULL,
    email character varying(100),
    password character varying(100) NOT NULL,
    avatar_url character varying(255) DEFAULT '/img/avatars/default.png'::character varying NOT NULL,
    google_id character varying(255) DEFAULT ''::character varying,
    facebook_id character varying(255) DEFAULT ''::character varying,
    github_id character varying(255) DEFAULT ''::character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO habi;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: habi
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO habi;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: habi
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: quiz id; Type: DEFAULT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz ALTER COLUMN id SET DEFAULT nextval('public.quiz_id_seq'::regclass);


--
-- Name: quiz user_id; Type: DEFAULT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz ALTER COLUMN user_id SET DEFAULT nextval('public.quiz_user_id_seq'::regclass);


--
-- Name: quiz_choice id; Type: DEFAULT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz_choice ALTER COLUMN id SET DEFAULT nextval('public.quiz_choice_id_seq'::regclass);


--
-- Name: quiz_choice question_id; Type: DEFAULT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz_choice ALTER COLUMN question_id SET DEFAULT nextval('public.quiz_choice_question_id_seq'::regclass);


--
-- Name: quiz_question id; Type: DEFAULT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz_question ALTER COLUMN id SET DEFAULT nextval('public.quiz_question_id_seq'::regclass);


--
-- Name: quiz_question quiz_id; Type: DEFAULT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz_question ALTER COLUMN quiz_id SET DEFAULT nextval('public.quiz_question_quiz_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: habi
--

COPY public.quiz (id, name, user_id, created_at, updated_at, deleted_at) FROM stdin;
\.
COPY public.quiz (id, name, user_id, created_at, updated_at, deleted_at) FROM '$$PATH$$/3403.dat';

--
-- Data for Name: quiz_choice; Type: TABLE DATA; Schema: public; Owner: habi
--

COPY public.quiz_choice (id, question_id, name, is_correct, created_at, updated_at, deleted_at) FROM stdin;
\.
COPY public.quiz_choice (id, question_id, name, is_correct, created_at, updated_at, deleted_at) FROM '$$PATH$$/3409.dat';

--
-- Data for Name: quiz_question; Type: TABLE DATA; Schema: public; Owner: habi
--

COPY public.quiz_question (id, quiz_id, name, is_use_image, image_url, created_at, updated_at, deleted_at) FROM stdin;
\.
COPY public.quiz_question (id, quiz_id, name, is_use_image, image_url, created_at, updated_at, deleted_at) FROM '$$PATH$$/3406.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: habi
--

COPY public.users (id, username, full_name, email, password, avatar_url, google_id, facebook_id, github_id, created_at, updated_at, deleted_at) FROM stdin;
\.
COPY public.users (id, username, full_name, email, password, avatar_url, google_id, facebook_id, github_id, created_at, updated_at, deleted_at) FROM '$$PATH$$/3400.dat';

--
-- Name: quiz_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: habi
--

SELECT pg_catalog.setval('public.quiz_choice_id_seq', 1, false);


--
-- Name: quiz_choice_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: habi
--

SELECT pg_catalog.setval('public.quiz_choice_question_id_seq', 1, false);


--
-- Name: quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: habi
--

SELECT pg_catalog.setval('public.quiz_id_seq', 1, true);


--
-- Name: quiz_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: habi
--

SELECT pg_catalog.setval('public.quiz_question_id_seq', 1, false);


--
-- Name: quiz_question_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: habi
--

SELECT pg_catalog.setval('public.quiz_question_quiz_id_seq', 1, false);


--
-- Name: quiz_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: habi
--

SELECT pg_catalog.setval('public.quiz_user_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: habi
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: quiz_choice quiz_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz_choice
    ADD CONSTRAINT quiz_choice_pkey PRIMARY KEY (id);


--
-- Name: quiz quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);


--
-- Name: quiz_question quiz_question_pkey; Type: CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: quiz_choice quiz_choice_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz_choice
    ADD CONSTRAINT quiz_choice_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.quiz_question(id);


--
-- Name: quiz_question quiz_question_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);


--
-- Name: quiz quiz_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: habi
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               