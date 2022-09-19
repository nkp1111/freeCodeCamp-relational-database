--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(80) NOT NULL,
    distance_in_million_light_year_mly numeric,
    other_names text,
    description text,
    galaxy_types_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_planet_in_km integer,
    radius_in_km numeric,
    description text
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
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number_of_moons integer,
    diameter_in_km integer,
    description text,
    has_life boolean,
    is_true_planet boolean,
    mass_in_kg text,
    orbital_period numeric,
    position_from_sun integer
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    astronomical_name text,
    meaning_of_name character varying(100),
    distance_from_us_in_light_year_approx integer,
    possible_age numeric
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2.45, 'M 31, Messier31, NGC224', 'It is closest galaxy to our milky way galaxy and expected to collide around 4-5 billion years later.', 3);
INSERT INTO public.galaxy VALUES (7, 'Virgo A', 53, 'Messier 87 M87, NGC4486', 'It is one of the brightest radio source in the sky and popular target for astronomers.', 1);
INSERT INTO public.galaxy VALUES (6, 'Condor', 212, 'NGC 6872', 'This galaxy has two elongated arms with stellar diameter of over 522,000 light-years', 3);
INSERT INTO public.galaxy VALUES (8, 'IC 5152', 5.8, '', 'It is one of the easiest galaxy to resolve into stars', 4);
INSERT INTO public.galaxy VALUES (2, 'Black Eye', 17.3, 'Sleeping Beauty, Evil Eye', 'A dark band of absorbing dust partially infront of its bright nucleus gave rise to its nickname of Sleeping Beauty', 2);
INSERT INTO public.galaxy VALUES (3, 'Comet', 3200, '', 'This galaxy is currently being ripped to pieces, moving through a cluster at speeds greater than 2 milliom mph', 2);
INSERT INTO public.galaxy VALUES (5, 'Tadpole', 400, NULL, 'It is hypthesized that a more compact intruder galaxy crossed slung around behind the Tadpole by their mutual gravitational attraction .', 3);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 0.025, NULL, 'The oldest stars in the Milky Way are nearl as old as the Universe itself.', 3);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'elliptical', 'Elliptical galaxies are the most abundant type of galaxy but because of their age and dim qualities, they are frequently outshone');
INSERT INTO public.galaxy_types VALUES (2, 'spiral', 'Spiral galaxies are twisted collection of stars and gas that often have beautiful shape and are made of hot, young stars.');
INSERT INTO public.galaxy_types VALUES (3, 'barred spiral', 'It is a spiral galaxy with central bar-shaped structure composed of stars.');
INSERT INTO public.galaxy_types VALUES (4, 'irregular', 'An irregular galaxy is a galaxy that does not have a distinct regular shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4, 'Luna (the Moon)', 384400, 3470, 'The Moon helps our planet to be more livable, causes tides and responsible for relatively steady climate');
INSERT INTO public.moon VALUES (2, 5, 'Phobos', 9380, 1370.520, 'Phobos is larger innermost moon of the two');
INSERT INTO public.moon VALUES (3, 5, 'Deimos', 23460, 251.625, 'It is smaller outermost moon expected to eventually escapes mars gravity');
INSERT INTO public.moon VALUES (4, 7, 'Ganymede', 1070000, 2631, 'It is largest moon, larger than Mercury and Pluto and if it were orbiting Sun instead of Jupiter it owuld be considered a Planet');
INSERT INTO public.moon VALUES (5, 7, 'Callisto', 1880000, 2400, 'It is comprised of rocks and ice, it is as large as mercury');
INSERT INTO public.moon VALUES (6, 7, 'Amalthea', 181300, 850500, 'It is small, very red, irregular shaped moon of jupiter');
INSERT INTO public.moon VALUES (7, 7, 'Himalia', 11737000, 38, 'It is 6th largest moon of Jupiter');
INSERT INTO public.moon VALUES (8, 8, 'Titan', 1221850, 2575, 'It is the only moon known to have dense atmosphere and bodies of liquid on its surface');
INSERT INTO public.moon VALUES (9, 8, 'Rhea', 527040, 765, 'It is composed of 75% water ice and 25% rocky material, has thin oxygen atmosphere');
INSERT INTO public.moon VALUES (10, 8, 'Phoebe', 12952000, 110, 'It is believed to be a captured centaur from kuiper belt');
INSERT INTO public.moon VALUES (11, 8, 'Hyperion', 1481000, 2931500, 'It is irregularly shaped and has a chaotic tumbling orbit around saturn');
INSERT INTO public.moon VALUES (12, 9, 'Titania', 435840, 789, 'It is largest moon of planet Uranus, and is believed to have a subsurface liquid water ocean');
INSERT INTO public.moon VALUES (13, 9, 'Puck', 86010, 77, 'It is dark, heavily cratered moon of Uranus');
INSERT INTO public.moon VALUES (14, 9, 'Umbriel', 265970, 584, 'It is 3rd largest moon and blue in color');
INSERT INTO public.moon VALUES (15, 10, 'Triton', 354800, 1350, 'It is the only large moon with retrograde orbit in the opposite direction of Neptune rotation');
INSERT INTO public.moon VALUES (16, 10, 'Proteus', 117600, 200, 'It is one of the darkest object, reflecting only 6%-10% of light');
INSERT INTO public.moon VALUES (17, 10, 'Hippocamp', 105283, 17, 'It is smallest moon of Neptune, orbits around Neptune in just 1 Earth day');
INSERT INTO public.moon VALUES (18, 11, 'Charon', 19640, 586, 'It has a size of about 51% of Pluto, that is why Charon along with Pluto is considered binary dwarf planet system');
INSERT INTO public.moon VALUES (19, 11, 'Hydra', NULL, 73125, 'It is irregular shaped, mostly consist of water ice');
INSERT INTO public.moon VALUES (20, 13, 'Dsynomia', NULL, 350, 'It is single moon of dwarf planet Eris');
INSERT INTO public.moon VALUES (21, 12, 'Namaka', NULL, 85, 'It is one of the two moon of dwarf planet Huamea');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 6, 'Eris', 1, 2326, 'It is most distant dwarf planet', false, false, '1.6 x 10^22', 203670, 12);
INSERT INTO public.planet VALUES (12, 6, 'Huamea', 2, 816, 'It is shaped like an egg thus making the least spherical dwarf planets.', false, false, '4 x 10^22', 103295, 11);
INSERT INTO public.planet VALUES (11, 6, 'Pluto', 5, 2301, 'It is primarily made out of ice and rock', false, false, '1.3 x 10^22', 90520, 10);
INSERT INTO public.planet VALUES (10, 6, 'Neptune', 14, 49530, 'It is considered furthest planet and has 6 known ring aound it.', false, true, '1.02 x 10^26', 60225, 9);
INSERT INTO public.planet VALUES (9, 6, 'Uranus', 27, 51120, 'It has the coldest planetary atmosphere in the solar system', false, true, '8.7 x 10^26', 30660, 8);
INSERT INTO public.planet VALUES (8, 6, 'Saturn', 82, 120500, 'It has lowest density of all the planets, if placed in water it would float', false, true, '5.69 x 10^26', 10767.5, 7);
INSERT INTO public.planet VALUES (7, 6, 'Jupiter', 80, 139822, 'It is largest and the oldest planet of our solar system', false, true, '1.9 x 10^27', 4380, 6);
INSERT INTO public.planet VALUES (5, 6, 'Mars', 2, 6787, 'It has tallest volcano/mountain in the entire solar system', false, true, '6.4 x 10^23', 687, 4);
INSERT INTO public.planet VALUES (4, 6, 'Earth', 1, 12760, 'Planet with the highest density in our solar system and only known location where life is present', true, true, '5.9 x 10^24', 365.24, 3);
INSERT INTO public.planet VALUES (3, 6, 'Venus', 0, 12104, 'It is hottest planet of our solar system', false, true, '4.8 x 10^24', 225, 2);
INSERT INTO public.planet VALUES (2, 6, 'Mercury', 0, 4878, 'Stucture-wise it is most similar to Earth', false, true, '3.3 x 10^23', 88, 1);
INSERT INTO public.planet VALUES (6, 6, 'Ceres', 0, 950, 'Only dwarf planet that is not located in the Kuiper Belt but rather in our inner solar system', false, false, '9.1 x 10^20', 1682, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 4, 'Sirius', 'Alpha Canis Majoris', 'scorching', 9, 250);
INSERT INTO public.star VALUES (2, 4, 'Canopus', 'Alpha Carinae', 'pilot of the ship Argo', 313, 10);
INSERT INTO public.star VALUES (3, 4, 'Arcturus', 'Alpha Bootis', 'guardian of the bear', 37, 7000);
INSERT INTO public.star VALUES (4, 4, 'Vega', 'Alpha Lyrae', 'eagle or vulture', 25, 455);
INSERT INTO public.star VALUES (5, 4, 'Capella', 'Alpha Aurigae', 'little she-goat', 42, 630);
INSERT INTO public.star VALUES (6, 4, 'Sun', '', 'star around which the earth moves', 0, 4600);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

