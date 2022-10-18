--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

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

ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_star_id_fkey;
ALTER TABLE ONLY public.planet_moons DROP CONSTRAINT planet_moons_planet_id_fkey;
ALTER TABLE ONLY public.planet_moons DROP CONSTRAINT planet_moons_moon_id_fkey;
ALTER TABLE ONLY public.stars DROP CONSTRAINT stars_pkey;
ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_pkey;
ALTER TABLE ONLY public.planet_moons DROP CONSTRAINT planet_moons_pkey;
ALTER TABLE ONLY public.moons DROP CONSTRAINT moons_pkey;
ALTER TABLE public.planet_moons ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.stars;
DROP TABLE public.planets;
DROP SEQUENCE public.planet_moons_id_seq;
DROP TABLE public.planet_moons;
DROP TABLE public.moons;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: moons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moons (
    name character varying(50) NOT NULL
);


--
-- Name: planet_moons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planet_moons (
    id integer NOT NULL,
    planet_id character varying(50),
    moon_id character varying(50)
);


--
-- Name: planet_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planet_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planet_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planet_moons_id_seq OWNED BY public.planet_moons.id;


--
-- Name: planets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planets (
    name character varying(50) NOT NULL,
    orbital_period double precision,
    star_id character varying(50) NOT NULL,
    num_moons integer DEFAULT 0 NOT NULL
);


--
-- Name: stars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stars (
    name character varying(50) NOT NULL,
    temp integer NOT NULL
);


--
-- Name: planet_moons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet_moons ALTER COLUMN id SET DEFAULT nextval('public.planet_moons_id_seq'::regclass);


--
-- Data for Name: moons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moons (name) FROM stdin;
The Moon
Phobos
Deimos
\.


--
-- Data for Name: planet_moons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planet_moons (id, planet_id, moon_id) FROM stdin;
1	Earth	The Moon
2	Mars	Phobos
3	Mars	Deimos
\.


--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planets (name, orbital_period, star_id, num_moons) FROM stdin;
Earth	1	The Sun	1
Mars	1.882	The Sun	2
Venus	0.62	The Sun	0
Proxima Centauri b	0.03	Proxima Centauri	0
Gliese 876 b	0.236	Gliese 876	0
\.


--
-- Data for Name: stars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stars (name, temp) FROM stdin;
The Sun	5800
Proxima Centauri	3042
Gliese 876	3192
\.


--
-- Name: planet_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planet_moons_id_seq', 3, true);


--
-- Name: moons moons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_pkey PRIMARY KEY (name);


--
-- Name: planet_moons planet_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_pkey PRIMARY KEY (id);


--
-- Name: planets planets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pkey PRIMARY KEY (name);


--
-- Name: stars stars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stars
    ADD CONSTRAINT stars_pkey PRIMARY KEY (name);


--
-- Name: planet_moons planet_moons_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moons(name);


--
-- Name: planet_moons planet_moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planets(name);


--
-- Name: planets planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.stars(name);


--
-- PostgreSQL database dump complete
--

