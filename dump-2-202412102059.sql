toc.dat                                                                                             0000600 0004000 0002000 00000012166 14726035450 0014453 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       ;        
        |            2    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    33338    2    DATABASE     w   CREATE DATABASE "2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "2";
                postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4         �            1259    33351    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    client_name character varying(255),
    total_price numeric(10,2),
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50),
    service_id integer,
    planing_end_date date
);
    DROP TABLE public.orders;
       public         heap    postgres    false    4         �            1259    33350    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    4    218         �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    217         �            1259    33340    services    TABLE     :  CREATE TABLE public.services (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    uri character varying
);
    DROP TABLE public.services;
       public         heap    postgres    false    4         �            1259    33339    services_id_seq    SEQUENCE     �   CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.services_id_seq;
       public          postgres    false    216    4         �           0    0    services_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;
          public          postgres    false    215         "           2604    33354 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218                    2604    33343    services id    DEFAULT     j   ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);
 :   ALTER TABLE public.services ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216         �          0    33351    orders 
   TABLE DATA           p   COPY public.orders (id, client_name, total_price, order_date, status, service_id, planing_end_date) FROM stdin;
    public          postgres    false    218       4794.dat �          0    33340    services 
   TABLE DATA           ]   COPY public.services (id, name, description, price, created_at, updated_at, uri) FROM stdin;
    public          postgres    false    216       4792.dat �           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 8, true);
          public          postgres    false    217         �           0    0    services_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.services_id_seq', 17, true);
          public          postgres    false    215         '           2606    33357    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    218         %           2606    33349    services services_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public            postgres    false    216                                                                                                                                                                                                                                                                                                                                                                                                                  4794.dat                                                                                            0000600 0004000 0002000 00000000543 14726035450 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	Иван Иванов	15000.00	2024-10-01 10:00:00	Завершено	4	2024-12-01
6	Петр Петров	15000.00	2024-10-10 12:30:00	Завершено	4	2024-12-01
7	Анна Смирнова	8000.00	2024-10-05 15:00:00	В процессе	5	2024-12-01
8	Ольга Сидорова	12000.00	2024-10-08 11:15:00	Завершено	7	2024-12-01
\.


                                                                                                                                                             4792.dat                                                                                            0000600 0004000 0002000 00000003606 14726035450 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        9	Видеомонтаж	Профессиональный видеомонтаж для рекламных роликов или презентаций.	30000.00	2024-10-20 23:03:58.98986	2024-10-20 23:03:58.98986	video-editing.jpg
2	Создание веб-сайта	Разработка индивидуального веб-сайта с использованием современных технологий.	50000.00	2024-10-20 23:03:58.98986	2024-10-20 23:03:58.98986	web-development.jpg
8	Анализ конкурентов	Анализ конкурентов для улучшения бизнес-стратегий и маркетинга.	25000.00	2024-10-20 23:03:58.98986	2024-10-20 23:03:58.98986	competitor-analysis.png
4	SEO-оптимизация	Оптимизация веб-сайта для улучшения видимости в поисковых системах.	15000.00	2024-10-20 23:03:58.98986	2024-10-20 23:03:58.98986	seo.png
6	Маркетинг в соцсетях	Создание и управление рекламными кампаниями в социальных сетях.	20000.00	2024-10-20 23:03:58.98986	2024-10-20 23:03:58.98986	social-media-marketing.png
7	Контент-менеджмент	Создание и управление контентом на вашем веб-сайте или в соцсетях.	12000.00	2024-10-20 23:03:58.98986	2024-10-20 23:03:58.98986	content-management.png
3	Поддержка сайта	Обновление и обслуживание веб-сайта, исправление багов и внесение измене	10000.00	2024-10-20 23:03:58.98986	2024-10-20 23:03:58.98986	website-maintenance.jpg
5	Дизайн логотипа	Создание уникального дизайна логотипа для вашего бренда.	8000.00	2024-10-20 23:03:58.98986	2024-10-20 23:03:58.98986	logo-design.jpg
\.


                                                                                                                          restore.sql                                                                                         0000600 0004000 0002000 00000011447 14726035450 0015401 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE "2";
--
-- Name: 2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "2" OWNER TO postgres;

\connect "2"

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    client_name character varying(255),
    total_price numeric(10,2),
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50),
    service_id integer,
    planing_end_date date
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
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    uri character varying
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, client_name, total_price, order_date, status, service_id, planing_end_date) FROM stdin;
\.
COPY public.orders (id, client_name, total_price, order_date, status, service_id, planing_end_date) FROM '$$PATH$$/4794.dat';

--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name, description, price, created_at, updated_at, uri) FROM stdin;
\.
COPY public.services (id, name, description, price, created_at, updated_at, uri) FROM '$$PATH$$/4792.dat';

--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 8, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 17, true);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         