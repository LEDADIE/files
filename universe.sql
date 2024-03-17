--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth numeric,
    galaxy_types character varying(50),
    size_numeric numeric NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_i_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_i_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_i_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_i_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_i_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    star_id integer NOT NULL,
    planet_types character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_type_id_seq OWNED BY public.star_types.star_types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_i_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_types star_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types ALTER COLUMN star_types_id SET DEFAULT nextval('public.star_types_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Spiral', 1000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 'Spiral', 1500000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2723000, 'Spiral', 800000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 17270000, 'Elliptical', 750000);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 52510000, 'Elliptical', 2000000);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool', 36400000, 'Spiral', 900000);
INSERT INTO public.galaxy VALUES (9, 'Sombrero', 34400000, 'Spiral', 600000);
INSERT INTO public.galaxy VALUES (10, 'Pinwheel', 23600000, 'Spiral', 850000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (46, 'Deimos', 4500, false, true, 7);
INSERT INTO public.moon VALUES (47, 'Ganymede', 4500, false, true, 8);
INSERT INTO public.moon VALUES (48, 'Callisto', 4500, false, true, 9);
INSERT INTO public.moon VALUES (49, 'Io', 4500, false, true, 10);
INSERT INTO public.moon VALUES (50, 'Titan', 4500, false, true, 11);
INSERT INTO public.moon VALUES (51, 'Triton', 4500, false, true, 12);
INSERT INTO public.moon VALUES (52, 'Charon', 4500, false, true, 13);
INSERT INTO public.moon VALUES (53, 'Deimos', 4500, false, true, 14);
INSERT INTO public.moon VALUES (54, 'Enceladus', 4500, false, true, 15);
INSERT INTO public.moon VALUES (55, 'Mimas', 4500, false, true, 16);
INSERT INTO public.moon VALUES (56, 'Rhea', 4500, false, true, 17);
INSERT INTO public.moon VALUES (57, 'Tethys', 4500, false, true, 18);
INSERT INTO public.moon VALUES (58, 'Luna', 4500, false, true, 21);
INSERT INTO public.moon VALUES (59, 'Deimos', 4500, false, true, 22);
INSERT INTO public.moon VALUES (60, 'Phobos', 4500, false, true, 23);
INSERT INTO public.moon VALUES (61, 'Europa', 4500, false, true, 24);
INSERT INTO public.moon VALUES (62, 'Titan', 4500, false, true, 25);
INSERT INTO public.moon VALUES (63, 'Triton', 4500, false, true, 26);
INSERT INTO public.moon VALUES (64, 'Charon', 4500, false, true, 27);
INSERT INTO public.moon VALUES (65, 'Ganymede', 4500, false, true, 28);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 'Jupiter', 'Fifth planet from the Sun', 4, 'Gas Giant');
INSERT INTO public.planet VALUES (8, 'Mars', 'Fourth planet from the Sun', 5, 'Terrestrial');
INSERT INTO public.planet VALUES (9, 'Earth', 'Third planet from the Sun', 6, 'Terrestrial');
INSERT INTO public.planet VALUES (10, 'Mercury', 'Closest planet to the Sun', 8, 'Terrestrial');
INSERT INTO public.planet VALUES (11, 'Venus', 'Second planet from the Sun', 9, 'Terrestrial');
INSERT INTO public.planet VALUES (12, 'Saturn', 'Sixth planet from the Sun', 4, 'Gas Giant');
INSERT INTO public.planet VALUES (13, 'Uranus', 'Seventh planet from the Sun', 7, 'Ice Giant');
INSERT INTO public.planet VALUES (14, 'Neptune', 'Eighth planet from the Sun', 10, 'Ice Giant');
INSERT INTO public.planet VALUES (15, 'Pluto', 'Dwarf planet in the Kuiper belt', 11, 'Dwarf Planet');
INSERT INTO public.planet VALUES (16, 'Charon', 'Largest moon of dwarf planet Pluto', 4, 'Moon');
INSERT INTO public.planet VALUES (17, 'Ceres', 'Dwarf planet in the asteroid belt', 7, 'Dwarf Planet');
INSERT INTO public.planet VALUES (18, '2003 UB313', 'Dwarf planet beyond Neptune', 8, 'Dwarf Planet');
INSERT INTO public.planet VALUES (21, 'Naftalie', 'Eighth planet from the Sun', 8, 'Ice Giant');
INSERT INTO public.planet VALUES (22, 'Plutor', 'Dwarf planet in the Kuiper belt', 10, 'Dwarf Planet');
INSERT INTO public.planet VALUES (23, 'Eris', 'Dwarf planet in the scattered disc', 9, 'Dwarf Planet');
INSERT INTO public.planet VALUES (24, 'Haumea', 'Dwarf planet in the Kuiper belt', 5, 'Dwarf Planet');
INSERT INTO public.planet VALUES (25, 'Makemake', 'Dwarf planet in the Kuiper belt', 4, 'Dwarf Planet');
INSERT INTO public.planet VALUES (26, 'Sedna', 'Trans-Neptunian object in the scattered disc', 10, 'Dwarf Planet');
INSERT INTO public.planet VALUES (27, 'Quaoar', 'Cubewano object in the Kuiper belt', 11, 'Dwarf Planet');
INSERT INTO public.planet VALUES (28, 'Oura', 'Eighth planet from the Sun', 8, 'Ice Giant');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Sun', 4600, false, true, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 6000, false, true, 2);
INSERT INTO public.star VALUES (6, 'Sirius', 200, false, true, 1);
INSERT INTO public.star VALUES (7, 'Vega', 455, false, true, 6);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 8000, false, true, 7);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 4000, false, true, 8);
INSERT INTO public.star VALUES (10, 'Canopus', 9000, false, true, 9);
INSERT INTO public.star VALUES (11, 'Polaris', 300, false, true, 10);


--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, 'Main Sequence', 'Stars in this phase are fusing hydrogen into helium in their cores.');
INSERT INTO public.star_types VALUES (2, 'Red Giant', 'Stars in this phase have exhausted their hydrogen cores and expanded.');
INSERT INTO public.star_types VALUES (3, 'White Dwarf', 'Stars in this phase have exhausted their nuclear fuel and collapsed into a dense core.');


--
-- Name: galaxy_galaxy_i_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_i_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 65, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_type_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_types star_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_name_key UNIQUE (name);


--
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

