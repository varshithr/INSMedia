--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: abn_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abn_menu (
    s_no integer NOT NULL,
    title character varying(25) NOT NULL,
    link character varying(100) NOT NULL,
    sliderpage boolean DEFAULT false
);


ALTER TABLE abn_menu OWNER TO postgres;

--
-- Name: abn_s_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abn_s_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abn_s_no_seq OWNER TO postgres;

--
-- Name: abn_s_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE abn_s_no_seq OWNED BY abn_menu.s_no;


--
-- Name: eenadu_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE eenadu_menu (
    s_no integer NOT NULL,
    title character varying(25) NOT NULL,
    link character varying(100) NOT NULL,
    slider_page boolean DEFAULT false
);


ALTER TABLE eenadu_menu OWNER TO postgres;

--
-- Name: eenadu_menu_s_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eenadu_menu_s_no_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eenadu_menu_s_no_seq OWNER TO postgres;

--
-- Name: eenadu_menu_s_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eenadu_menu_s_no_seq OWNED BY eenadu_menu.s_no;


--
-- Name: ga_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ga_menu (
    s_no integer NOT NULL,
    title character varying(25) NOT NULL,
    link character varying(100) NOT NULL,
    sliderpage boolean DEFAULT false
);


ALTER TABLE ga_menu OWNER TO postgres;

--
-- Name: ga_menu_s_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ga_menu_s_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ga_menu_s_no_seq OWNER TO postgres;

--
-- Name: ga_menu_s_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ga_menu_s_no_seq OWNED BY ga_menu.s_no;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE posts (
    s_no integer NOT NULL,
    paper character varying(25) NOT NULL,
    display_title character varying(256),
    newsitem_link character varying(256) NOT NULL,
    image_link character varying(256),
    classifier character varying(75),
    article_content text,
    url_inserted_date date
);


ALTER TABLE posts OWNER TO postgres;

--
-- Name: posts_s_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE posts_s_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_s_no_seq OWNER TO postgres;

--
-- Name: posts_s_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE posts_s_no_seq OWNED BY posts.s_no;


--
-- Name: sakshi_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sakshi_menu (
    s_no integer NOT NULL,
    title character varying(25) NOT NULL,
    link character varying(100) NOT NULL,
    sliderpage boolean DEFAULT false
);


ALTER TABLE sakshi_menu OWNER TO postgres;

--
-- Name: sakshi_menu_s_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sakshi_menu_s_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sakshi_menu_s_no_seq OWNER TO postgres;

--
-- Name: sakshi_menu_s_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sakshi_menu_s_no_seq OWNED BY sakshi_menu.s_no;


--
-- Name: samayam_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE samayam_menu (
    s_no integer NOT NULL,
    title character varying(25) NOT NULL,
    link character varying(100) NOT NULL
);


ALTER TABLE samayam_menu OWNER TO postgres;

--
-- Name: samayam_menu_s_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE samayam_menu_s_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE samayam_menu_s_no_seq OWNER TO postgres;

--
-- Name: samayam_menu_s_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE samayam_menu_s_no_seq OWNED BY samayam_menu.s_no;


--
-- Name: tupaki_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tupaki_menu (
    s_no integer NOT NULL,
    title character varying(25) NOT NULL,
    link character varying(100) NOT NULL,
    sliderpage boolean DEFAULT false
);


ALTER TABLE tupaki_menu OWNER TO postgres;

--
-- Name: tupaki_menu_s_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tupaki_menu_s_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tupaki_menu_s_no_seq OWNER TO postgres;

--
-- Name: tupaki_menu_s_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tupaki_menu_s_no_seq OWNED BY tupaki_menu.s_no;


--
-- Name: s_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abn_menu ALTER COLUMN s_no SET DEFAULT nextval('abn_s_no_seq'::regclass);


--
-- Name: s_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eenadu_menu ALTER COLUMN s_no SET DEFAULT nextval('eenadu_menu_s_no_seq'::regclass);


--
-- Name: s_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ga_menu ALTER COLUMN s_no SET DEFAULT nextval('ga_menu_s_no_seq'::regclass);


--
-- Name: s_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts ALTER COLUMN s_no SET DEFAULT nextval('posts_s_no_seq'::regclass);


--
-- Name: s_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sakshi_menu ALTER COLUMN s_no SET DEFAULT nextval('sakshi_menu_s_no_seq'::regclass);


--
-- Name: s_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY samayam_menu ALTER COLUMN s_no SET DEFAULT nextval('samayam_menu_s_no_seq'::regclass);


--
-- Name: s_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tupaki_menu ALTER COLUMN s_no SET DEFAULT nextval('tupaki_menu_s_no_seq'::regclass);


--
-- Data for Name: abn_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY abn_menu (s_no, title, link, sliderpage) FROM stdin;
3	National	http://www.andhrajyothy.com/Pages/National.aspx	f
4	Sports	http://www.andhrajyothy.com/Pages/Sports.aspx	f
7	Editorial	http://www.andhrajyothy.com/Pages/Editorial.aspx	f
8	Business	http://www.andhrajyothy.com/Pages/Business.aspx	f
1	AndhraPradesh	http://www.andhrajyothy.com/Pages/AndhraPradesh.aspx	t
2	Telangana	http://www.andhrajyothy.com/Pages/Telangana.aspx	t
5	Chitrajyothy	http://www.andhrajyothy.com/Pages/Chitrajyothy.aspx	t
17	Home	http://www.andhrajyothy.com/	t
\.


--
-- Name: abn_s_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('abn_s_no_seq', 1, false);


--
-- Data for Name: eenadu_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eenadu_menu (s_no, title, link, slider_page) FROM stdin;
4	crime news	http://www.eenadu.net/crime-news/crime-news.aspx	f
5	business	http://www.eenadu.net/business/business-news.aspx	f
6	sports	http://www.eenadu.net/sports/sports.aspx	f
7	movies	http://www.eenadu.net/movies/latest-movie-news.aspx	f
1	Andhra Pradesh	http://www.eenadu.net/andhra-pradesh-news.aspx	t
9	Home	http://www.eenadu.net/home.aspx	t
2	Telangana	http://www.eenadu.net/telangana-news.aspx	t
3	national-international	http://www.eenadu.net/national-international/national-international-news.aspx	f
10	adilabad	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=adilabad	f
11	hyderabad	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=hyderabad	f
12	karimnagar	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=karimnagar	f
13	khammam	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=khammam	f
14	medak	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=medak	f
15	mahabubnagar	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=mahabubnagar	f
16	nalgonda	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=nalgonda	f
17	nizamabad	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=nizamabad	f
18	badradri	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=badradri	f
19	jagtial	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=jagtial	f
20	jangaon	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=jangaon	f
21	jayashankar	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=jayashankar	f
22	jogulamba	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=jogulamba	f
23	kamareddy	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=kamareddy	f
24	komarambheem	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=komarambheem	f
25	mahabubabad	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=mahabubabad	f
26	mancherial	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=mancherial	f
27	nagarkurnool	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=nagarkurnool	f
28	nirmal	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=nirmal	f
29	peddapalle	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=peddapalle	f
30	rajanna	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=rajanna	f
31	sangareddi	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=sangareddi	f
32	siddipet	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=siddipet	f
33	suryapet	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=suryapet	f
34	vikarabad	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=vikarabad	f
35	wanaparthy	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=wanaparthy	f
36	warangalrural	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=warangalrural	f
37	warangalurban	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=warangalurban	f
38	yadadri	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=yadadri	f
39	amaravati	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=amaravati	f
40	anantapur	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=anantapur	f
41	chittoor	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=chittoor	f
42	eastgodavari	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=eastgodavari	f
43	guntur	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=guntur	f
44	kadapa	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=kadapa	f
45	krishna	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=krishna	f
46	kurnool	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=kurnool	f
47	nellore	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=nellore	f
48	prakasam	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=prakasam	f
49	srikakulam	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=srikakulam	f
50	visakhapatnam	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=visakhapatnam	f
51	vizianagaram	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=vizianagaram	f
52	westgodavari	http://www.eenadu.net/home.aspx/district/main.aspx?dsname=westgodavari	f
\.


--
-- Name: eenadu_menu_s_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eenadu_menu_s_no_seq', 52, true);


--
-- Data for Name: ga_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ga_menu (s_no, title, link, sliderpage) FROM stdin;
2	రాజకీయాలు	http://telugu.greatandhra.com/catviews.php?cat=16	f
3	సినిమా	http://telugu.greatandhra.com/movies.php	f
4	సినిమా రివ్యూ	http://telugu.greatandhra.com/reviews.php	f
5	ఎమ్బీయస్‌	http://telugu.greatandhra.com/mbs.php	f
6	ఇంటర్వ్యూ	http://telugu.greatandhra.com/interviews.php	f
\.


--
-- Name: ga_menu_s_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ga_menu_s_no_seq', 11, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY posts (s_no, paper, display_title, newsitem_link, image_link, classifier, article_content, url_inserted_date) FROM stdin;
1	samayam	బ్రోతల్ ఓనర్‌గా విద్యాబాలన్ విశ్వరూపం!	/telugu-movies/cinema-news/begum-jaan-trailer-vidya-balan-will-stun-you-as-the-fiery-and-fearless-brothel-owner/articleshow/57632595.cms	\N	topnews	\N	2017-03-14
2	samayam	గోవా సీఎంగా మనోహర్ పారికర్ ప్రమాణం	/latest-news/india-news/manohar-parrikar-takes-oath-as-goa-chief-minister/articleshow/57631867.cms	\N	topnews	\N	2017-03-14
3	samayam	రామ్‌చరణ్ సినిమాలో అరవింద్ స్వామి	/telugu-movies/cinema-news/arvind-swami-to-play-a-pivotal-role-in-ramcharan-maniratnam-film/articleshow/57630125.cms	\N	topnews	\N	2017-03-14
4	samayam	చిరంజీవి జనసేన పార్టీలోకి రారు : పవన్	/latest-news/state-news/pawan-kalyan-comments-on-chiranjeevi-etry-in-to-janasena-party/articleshow/57631462.cms	\N	topnews	\N	2017-03-14
5	samayam	జుట్టు రాలడాన్ని అరికట్టే మందులతో బహుపరాక్!	/lifestyle-news/health/drugs-to-prevent-hair-loss-can-make-men-impotent-for-years/articleshow/57632599.cms	\N	topnews	\N	2017-03-14
6	samayam	2 రాష్ట్రాల్లో సమరం.. 60% సీట్లు వారికే: పవన్	/latest-news/state-news/pawan-kalyan-press-meet-on-janasena-partys-third-anniversary/articleshow/57630841.cms	\N	topnews	\N	2017-03-14
7	samayam	​మోడీతో పవన్ కల్యాణ్ కు సంబంధం లేనట్టే!	/latest-news/state-news/pavan-maintaining-distance-from-nda/articleshow/57631981.cms	\N	topnews	\N	2017-03-14
8	samayam	ఆఫీసులో ఆకలేసిందని.. సీపీయూ విప్పేసి..	/lifestyle-news/recipes/chinese-woman-cooking-with-her-office-equipment/articleshow/57631999.cms	\N	topnews	\N	2017-03-14
9	samayam	ఇది తెలిస్తే.. సైనికులకు జై కొట్టకుండా ఉండలేరు!	/latest-news/india-news/amazing-facts-about-the-indian-army-that-will-make-you-proud/articleshow/57630282.cms	\N	topnews	\N	2017-03-14
10	samayam	పవన్ ‘జనసేన’.. పయనం ఎటువైపు?	/latest-news/state-news/janasena-completed-3-years-and-what-is-the-party-position-now/articleshow/57629410.cms	\N	topnews	\N	2017-03-14
11	samayam	బ్యాంకును బురిడీ కొట్టిద్దామని బొక్కబోర్లా!	/latest-news/state-news/fake-notes-worth-rs-9-90-lakh-surface-in-hyderabad-bank-man-held/articleshow/57630090.cms	\N	topnews	\N	2017-03-14
12	samayam	క్రికెట్ ప్రపంచంలోకి మళ్లీ ఆ గొంతు..?	/sports-news/cricket/harsha-bhogle-may-return-to-host-ipl-matches/articleshow/57629107.cms	\N	topnews	\N	2017-03-14
13	samayam	ఉప్పుని ఇలా కూడా వాడొచ్చు	/lifestyle-news/health/10-ways-to-use-ordinary-table-salt-around-the-house/articleshow/57630193.cms	\N	topnews	\N	2017-03-14
15	samayam	బ్రోతల్ ఓనర్‌గా విద్యాబాలన్ విశ్వరూపం!	/telugu-movies/cinema-news/begum-jaan-trailer-vidya-balan-will-stun-you-as-the-fiery-and-fearless-brothel-owner/articleshow/57632595.cms	\N	topnews	\N	2017-03-14
16	samayam	గోవా సీఎంగా మనోహర్ పారికర్ ప్రమాణం	/latest-news/india-news/manohar-parrikar-takes-oath-as-goa-chief-minister/articleshow/57631867.cms	\N	topnews	\N	2017-03-14
17	samayam	రామ్‌చరణ్ సినిమాలో అరవింద్ స్వామి	/telugu-movies/cinema-news/arvind-swami-to-play-a-pivotal-role-in-ramcharan-maniratnam-film/articleshow/57630125.cms	\N	topnews	\N	2017-03-14
18	samayam	చిరంజీవి జనసేన పార్టీలోకి రారు : పవన్	/latest-news/state-news/pawan-kalyan-comments-on-chiranjeevi-etry-in-to-janasena-party/articleshow/57631462.cms	\N	topnews	\N	2017-03-14
19	samayam	జుట్టు రాలడాన్ని అరికట్టే మందులతో బహుపరాక్!	/lifestyle-news/health/drugs-to-prevent-hair-loss-can-make-men-impotent-for-years/articleshow/57632599.cms	\N	topnews	\N	2017-03-14
20	samayam	2 రాష్ట్రాల్లో సమరం.. 60% సీట్లు వారికే: పవన్	/latest-news/state-news/pawan-kalyan-press-meet-on-janasena-partys-third-anniversary/articleshow/57630841.cms	\N	topnews	\N	2017-03-14
21	samayam	​మోడీతో పవన్ కల్యాణ్ కు సంబంధం లేనట్టే!	/latest-news/state-news/pavan-maintaining-distance-from-nda/articleshow/57631981.cms	\N	topnews	\N	2017-03-14
22	samayam	ఆఫీసులో ఆకలేసిందని.. సీపీయూ విప్పేసి..	/lifestyle-news/recipes/chinese-woman-cooking-with-her-office-equipment/articleshow/57631999.cms	\N	topnews	\N	2017-03-14
23	samayam	ఇది తెలిస్తే.. సైనికులకు జై కొట్టకుండా ఉండలేరు!	/latest-news/india-news/amazing-facts-about-the-indian-army-that-will-make-you-proud/articleshow/57630282.cms	\N	topnews	\N	2017-03-14
24	samayam	పవన్ ‘జనసేన’.. పయనం ఎటువైపు?	/latest-news/state-news/janasena-completed-3-years-and-what-is-the-party-position-now/articleshow/57629410.cms	\N	topnews	\N	2017-03-14
25	samayam	బ్యాంకును బురిడీ కొట్టిద్దామని బొక్కబోర్లా!	/latest-news/state-news/fake-notes-worth-rs-9-90-lakh-surface-in-hyderabad-bank-man-held/articleshow/57630090.cms	\N	topnews	\N	2017-03-14
26	samayam	క్రికెట్ ప్రపంచంలోకి మళ్లీ ఆ గొంతు..?	/sports-news/cricket/harsha-bhogle-may-return-to-host-ipl-matches/articleshow/57629107.cms	\N	topnews	\N	2017-03-14
27	samayam	ఉప్పుని ఇలా కూడా వాడొచ్చు	/lifestyle-news/health/10-ways-to-use-ordinary-table-salt-around-the-house/articleshow/57630193.cms	\N	topnews	\N	2017-03-14
28	samayam		/telugu-movies/cinema-news/mom-first-look/articleshow/57627964.cms	\N	telugu-movies	\N	2017-03-14
29	samayam		/telugu-movies/cinema-news/lost-many-chances-because-of-my-dark/articleshow/57624220.cms	\N	telugu-movies	\N	2017-03-14
30	samayam		/telugu-movies/cinema-news/avasarala-srinivas-babu-baga-busy-to-release-on-april-13/articleshow/57621875.cms	\N	telugu-movies	\N	2017-03-14
31	samayam		/telugu-movies/cinema-news/pawan-kalyans-katamarayudu-teaser-creates-new-record-in-tollywood/articleshow/57621185.cms	\N	telugu-movies	\N	2017-03-14
33	samayam	బ్రోతల్ ఓనర్‌గా విద్యాబాలన్ విశ్వరూపం!	/telugu-movies/cinema-news/begum-jaan-trailer-vidya-balan-will-stun-you-as-the-fiery-and-fearless-brothel-owner/articleshow/57632595.cms	\N	topnews	\N	2017-03-14
34	samayam	గోవా సీఎంగా మనోహర్ పారికర్ ప్రమాణం	/latest-news/india-news/manohar-parrikar-takes-oath-as-goa-chief-minister/articleshow/57631867.cms	\N	topnews	\N	2017-03-14
35	samayam	రామ్‌చరణ్ సినిమాలో అరవింద్ స్వామి	/telugu-movies/cinema-news/arvind-swami-to-play-a-pivotal-role-in-ramcharan-maniratnam-film/articleshow/57630125.cms	\N	topnews	\N	2017-03-14
36	samayam	చిరంజీవి జనసేన పార్టీలోకి రారు : పవన్	/latest-news/state-news/pawan-kalyan-comments-on-chiranjeevi-etry-in-to-janasena-party/articleshow/57631462.cms	\N	topnews	\N	2017-03-14
37	samayam	జుట్టు రాలడాన్ని అరికట్టే మందులతో బహుపరాక్!	/lifestyle-news/health/drugs-to-prevent-hair-loss-can-make-men-impotent-for-years/articleshow/57632599.cms	\N	topnews	\N	2017-03-14
38	samayam	2 రాష్ట్రాల్లో సమరం.. 60% సీట్లు వారికే: పవన్	/latest-news/state-news/pawan-kalyan-press-meet-on-janasena-partys-third-anniversary/articleshow/57630841.cms	\N	topnews	\N	2017-03-14
39	samayam	​మోడీతో పవన్ కల్యాణ్ కు సంబంధం లేనట్టే!	/latest-news/state-news/pavan-maintaining-distance-from-nda/articleshow/57631981.cms	\N	topnews	\N	2017-03-14
40	samayam	ఆఫీసులో ఆకలేసిందని.. సీపీయూ విప్పేసి..	/lifestyle-news/recipes/chinese-woman-cooking-with-her-office-equipment/articleshow/57631999.cms	\N	topnews	\N	2017-03-14
41	samayam	ఇది తెలిస్తే.. సైనికులకు జై కొట్టకుండా ఉండలేరు!	/latest-news/india-news/amazing-facts-about-the-indian-army-that-will-make-you-proud/articleshow/57630282.cms	\N	topnews	\N	2017-03-14
42	samayam	పవన్ ‘జనసేన’.. పయనం ఎటువైపు?	/latest-news/state-news/janasena-completed-3-years-and-what-is-the-party-position-now/articleshow/57629410.cms	\N	topnews	\N	2017-03-14
43	samayam	బ్యాంకును బురిడీ కొట్టిద్దామని బొక్కబోర్లా!	/latest-news/state-news/fake-notes-worth-rs-9-90-lakh-surface-in-hyderabad-bank-man-held/articleshow/57630090.cms	\N	topnews	\N	2017-03-14
44	samayam	క్రికెట్ ప్రపంచంలోకి మళ్లీ ఆ గొంతు..?	/sports-news/cricket/harsha-bhogle-may-return-to-host-ipl-matches/articleshow/57629107.cms	\N	topnews	\N	2017-03-14
45	samayam	ఉప్పుని ఇలా కూడా వాడొచ్చు	/lifestyle-news/health/10-ways-to-use-ordinary-table-salt-around-the-house/articleshow/57630193.cms	\N	topnews	\N	2017-03-14
46	samayam	రికార్డు ధరకి 2.0 శాటిలైట్ హక్కులు!	/telugu-movies/cinema-news/shankar-rajinikanth-film-2-0-satellite-rights-sold-for-rs-110-crore-to-zee/articleshow/57618613.cms	\N	telugu-movies	\N	2017-03-14
47	samayam	'ఖైదీ నెంబర్ 150'లో డిలీట్ చేసిన సీన్స్	/telugu-movies/cinema-news/deleted-scenes-from-chiranjeevis-khaidi-no-150-movie/articleshow/57618522.cms	\N	telugu-movies	\N	2017-03-14
48	samayam		/telugu-movies/cinema-news/arvind-swami-to-play-a-pivotal-role-in-ramcharan-maniratnam-film/articleshow/57630125.cms	\N	telugu-movies	\N	2017-03-14
49	samayam	బ్రోతల్ ఓనర్‌గా విద్యాబాలన్ విశ్వరూపం!	/telugu-movies/cinema-news/begum-jaan-trailer-vidya-balan-will-stun-you-as-the-fiery-and-fearless-brothel-owner/articleshow/57632595.cms	\N	telugu-movies	\N	2017-03-14
50	samayam		/telugu-movies/cinema-news/deleted-scenes-from-chiranjeevis-khaidi-no-150-movie/articleshow/57618522.cms	\N	telugu-movies	\N	2017-03-14
51	samayam	కరణ్-కంగనాల వివాదంపై అమీర్ ఖాన్ స్పందనేంటి ?	/telugu-movies/cinema-news/aamir-khan-offered-his-views-about-nepotism-in-bollywood/articleshow/57629076.cms	\N	telugu-movies	\N	2017-03-14
52	samayam		/telugu-movies/cinema-news/mom-first-look/articleshow/57627964.cms	\N	telugu-movies	\N	2017-03-14
53	samayam		/telugu-movies/cinema-news/aamir-khan-offered-his-views-about-nepotism-in-bollywood/articleshow/57629076.cms	\N	telugu-movies	\N	2017-03-14
54	samayam		/telugu-movies/cinema-news/avasarala-srinivas-babu-baga-busy-to-release-on-april-13/articleshow/57621875.cms	\N	telugu-movies	\N	2017-03-14
55	samayam		/telugu-movies/cinema-news/lost-many-chances-because-of-my-dark/articleshow/57624220.cms	\N	telugu-movies	\N	2017-03-14
56	samayam		/telugu-movies/cinema-news/shankar-rajinikanth-film-2-0-satellite-rights-sold-for-rs-110-crore-to-zee/articleshow/57618613.cms	\N	telugu-movies	\N	2017-03-14
57	samayam		/telugu-movies/cinema-news/pawan-kalyans-katamarayudu-teaser-creates-new-record-in-tollywood/articleshow/57621185.cms	\N	telugu-movies	\N	2017-03-14
58	samayam	శ్రీదేవి ‘మామ్’ ఫస్ట్‌లుక్.. అంతులేని ప్రశ్నలు	/telugu-movies/cinema-news/mom-first-look/articleshow/57627964.cms	\N	telugu-movies	\N	2017-03-14
59	samayam		/telugu-movies/cinema-news/begum-jaan-trailer-vidya-balan-will-stun-you-as-the-fiery-and-fearless-brothel-owner/articleshow/57632595.cms	\N	telugu-movies	\N	2017-03-14
60	samayam	యాంకర్ శ్రీముఖితో ‘బాబు బా...గా బిజీ’	/telugu-movies/cinema-news/avasarala-srinivas-babu-baga-busy-to-release-on-april-13/articleshow/57621875.cms	\N	telugu-movies	\N	2017-03-14
61	samayam	దర్శకులు నన్ను అలానే చూస్తున్నారు: నటి	/telugu-movies/cinema-news/lost-many-chances-because-of-my-dark/articleshow/57624220.cms	\N	telugu-movies	\N	2017-03-14
62	samayam	బాహుబలి-2 ట్రైలర్ టీజర్	/telugu-movies/cinema-news/baahubali-2-trailer-teaser/articleshow/57618437.cms	\N	telugu-movies	\N	2017-03-14
63	samayam	రామ్‌చరణ్-మణిరత్నం సినిమాలో అరవింద్ స్వామి	/telugu-movies/cinema-news/arvind-swami-to-play-a-pivotal-role-in-ramcharan-maniratnam-film/articleshow/57630125.cms	\N	telugu-movies	\N	2017-03-14
64	samayam		/telugu-movies/cinema-news/baahubali-2-trailer-teaser/articleshow/57618437.cms	\N	telugu-movies	\N	2017-03-14
65	samayam	ఆల్ టైం రికార్డ్: కోటి కొట్టిన కాటమరాయుడు	/telugu-movies/cinema-news/pawan-kalyans-katamarayudu-teaser-creates-new-record-in-tollywood/articleshow/57621185.cms	\N	telugu-movies	\N	2017-03-14
66	samayam		/social/two-girls-eloped-from-home-and-have-got-married-in-bengaluru/articleshow/57612857.cms	\N	social	\N	2017-03-14
67	samayam		/social/karnataka-doctors-card-swiped-for-rs-4-lakh-instead-of-rs-40-at-toll-booth/articleshow/57626591.cms	\N	social	\N	2017-03-14
68	samayam		/social/rtc-to-pay-senior-citizen-rs-10000-for-not-providing-bus-seat/articleshow/57616934.cms	\N	social	\N	2017-03-14
69	samayam		/social/beggar-helps-woman-deliver-baby-girl-at-busy-junction/articleshow/57617113.cms	\N	social	\N	2017-03-14
70	samayam		/social/brazil-president-michel-temer-leaves-residence-due-to-ghosts/articleshow/57627672.cms	\N	social	\N	2017-03-14
71	samayam		/social/doctor-attempts-to-rape-patient/articleshow/57612581.cms	\N	social	\N	2017-03-14
72	samayam	హ్యాట్సాఫ్ రైల్వే: పసికందు ఆకలి తీర్చేందుకు ఆగిన రైలు	/social/railway-responds-to-a-tweet-about-babys-milk-feed/articleshow/57628563.cms	\N	social	\N	2017-03-14
73	samayam	దయ్యం భయంతో అధ్యక్ష భవనం వదిలి..	/social/brazil-president-michel-temer-leaves-residence-due-to-ghosts/articleshow/57627672.cms	\N	social	\N	2017-03-14
74	samayam	రూ. 40కి బదులు రూ. 4 లక్షలు గీకేశారు!	/social/karnataka-doctors-card-swiped-for-rs-4-lakh-instead-of-rs-40-at-toll-booth/articleshow/57626591.cms	\N	social	\N	2017-03-14
75	samayam	సీటు ఇవ్వలేకపోయినందుకు ఆర్టీసీపై జరిమానా!	/social/rtc-to-pay-senior-citizen-rs-10000-for-not-providing-bus-seat/articleshow/57616934.cms	\N	social	\N	2017-03-14
76	samayam	ఆ పేదరాలిది ఎంత పెద్ద హృదయమో..!	/social/beggar-helps-woman-deliver-baby-girl-at-busy-junction/articleshow/57617113.cms	\N	social	\N	2017-03-14
77	samayam	పారిపోయి పెళ్లి చేసుకున్న యువతులు	/social/two-girls-eloped-from-home-and-have-got-married-in-bengaluru/articleshow/57612857.cms	\N	social	\N	2017-03-14
78	samayam	ఆసుపత్రిలోనే డాక్టర్ అత్యాచారయత్నం	/social/doctor-attempts-to-rape-patient/articleshow/57612581.cms	\N	social	\N	2017-03-14
79	samayam	వన్య ప్రాణుల దాహార్తి తీర్చడానికి.. ఓ మనిషి పడుతున్న తపన	/social/man-travels-hours-every-day-to-bring-water-to-thirsty-animals/articleshow/57603483.cms	\N	social	\N	2017-03-14
80	samayam		/social/five-smart-dogs-use-tactics-to-beat-a-king-cobra/articleshow/57631292.cms	\N	social	\N	2017-03-14
81	samayam		/social/man-travels-hours-every-day-to-bring-water-to-thirsty-animals/articleshow/57603483.cms	\N	social	\N	2017-03-14
82	samayam	​ వివాహితపై గ్యాంగ్ రేప్.. పిలిస్తేనే వచ్చింది	/social/28-year-old-mother-of-two-gang-raped-by-5-men/articleshow/57614142.cms	\N	social	\N	2017-03-14
83	samayam		/social/28-year-old-mother-of-two-gang-raped-by-5-men/articleshow/57614142.cms	\N	social	\N	2017-03-14
84	samayam	కింగ్ కోబ్రా.. అయితే మాకేంటి!	/social/five-smart-dogs-use-tactics-to-beat-a-king-cobra/articleshow/57631292.cms	\N	social	\N	2017-03-14
85	samayam		/social/railway-responds-to-a-tweet-about-babys-milk-feed/articleshow/57628563.cms	\N	social	\N	2017-03-14
86	samayam		/latest-news/state-news/ap-assembly-tributes-bhuma-nagi-reddy/articleshow/57627617.cms	\N	latest-news	\N	2017-03-14
87	samayam		/latest-news/state-news/big-releaf-for-gali-family/articleshow/57629697.cms	\N	latest-news	\N	2017-03-14
88	samayam		/latest-news/state-news/pavan-maintaining-distance-from-nda/articleshow/57631981.cms	\N	latest-news	\N	2017-03-14
89	samayam		/latest-news/india-news/amazing-facts-about-the-indian-army-that-will-make-you-proud/articleshow/57630282.cms	\N	latest-news	\N	2017-03-14
90	samayam		/latest-news/state-news/telangana-no-1-state-in-grouth-says-kcr/articleshow/57631923.cms	\N	latest-news	\N	2017-03-14
91	samayam		/latest-news/state-news/janasena-completed-3-years-and-what-is-the-party-position-now/articleshow/57629410.cms	\N	latest-news	\N	2017-03-14
92	samayam		/latest-news/state-news/pawan-kalyan-press-meet-on-janasena-partys-third-anniversary/articleshow/57630841.cms	\N	latest-news	\N	2017-03-14
93	samayam	అమ్మానాన్న ఆశయాలను నెరవేరుస్తా: అఖిలప్రియ	/latest-news/state-news/ap-assembly-tributes-bhuma-nagi-reddy/articleshow/57627617.cms	\N	latest-news	\N	2017-03-14
94	samayam		/latest-news/state-news/pawan-kalyan-comments-on-chiranjeevi-etry-in-to-janasena-party/articleshow/57631462.cms	\N	latest-news	\N	2017-03-14
95	samayam	బ్యాంకును బురిడీ కొట్టిద్దామని.. బొక్కబోర్లా పడ్డాడు!	/latest-news/state-news/fake-notes-worth-rs-9-90-lakh-surface-in-hyderabad-bank-man-held/articleshow/57630090.cms	\N	latest-news	\N	2017-03-14
96	samayam	ఇది తెలిస్తే.. సైనికులకు జై కొట్టకుండా ఉండలేరు!	/latest-news/india-news/amazing-facts-about-the-indian-army-that-will-make-you-proud/articleshow/57630282.cms	\N	latest-news	\N	2017-03-14
97	samayam	రూ.884 కోట్లు: గాలి జనార్ధన్ రెడ్డి కుటుంబం ఖాతాలోకే!	/latest-news/state-news/big-releaf-for-gali-family/articleshow/57629697.cms	\N	latest-news	\N	2017-03-14
98	samayam	పవన్ ‘జనసేన’.. పయనం ఎటువైపు?	/latest-news/state-news/janasena-completed-3-years-and-what-is-the-party-position-now/articleshow/57629410.cms	\N	latest-news	\N	2017-03-14
99	samayam	గోవా సీఎంగా మనోహర్ పారికర్ ప్రమాణం	/latest-news/india-news/manohar-parrikar-takes-oath-as-goa-chief-minister/articleshow/57631867.cms	\N	latest-news	\N	2017-03-14
100	samayam	​మోడీతో పవన్ కల్యాణ్ కు సంబంధం లేనట్టే!	/latest-news/state-news/pavan-maintaining-distance-from-nda/articleshow/57631981.cms	\N	latest-news	\N	2017-03-14
101	samayam	చిరంజీవి జనసేన పార్టీలోకి రారు : పవన్	/latest-news/state-news/pawan-kalyan-comments-on-chiranjeevi-etry-in-to-janasena-party/articleshow/57631462.cms	\N	latest-news	\N	2017-03-14
102	samayam	తెలంగాణ, ఏపీలో సమరం.. 60% సీట్లు వారికే: పవన్	/latest-news/state-news/pawan-kalyan-press-meet-on-janasena-partys-third-anniversary/articleshow/57630841.cms	\N	latest-news	\N	2017-03-14
103	samayam		/latest-news/state-news/fake-notes-worth-rs-9-90-lakh-surface-in-hyderabad-bank-man-held/articleshow/57630090.cms	\N	latest-news	\N	2017-03-14
104	samayam	ఆదాయం పెరుగుదలలో మనమే నంబర్ 1: కేసీఆర్	/latest-news/state-news/telangana-no-1-state-in-grouth-says-kcr/articleshow/57631923.cms	\N	latest-news	\N	2017-03-14
105	samayam		/latest-news/india-news/manohar-parrikar-takes-oath-as-goa-chief-minister/articleshow/57631867.cms	\N	latest-news	\N	2017-03-14
106	samayam		/sports-news/cricket/anil-kumble-to-become-team-director-rahul-dravid-to-become-coach-report/articleshow/57606575.cms	\N	sports-news	\N	2017-03-14
107	samayam		/sports-news/cricket/virat-kohli-is-frustrated-as-he-has-hasnt-scored-runs/articleshow/57612739.cms	\N	sports-news	\N	2017-03-14
108	samayam		/sports-news/cricket/hazel-keech-leaves-party-due-to-yuvraj-singhs-ex-girlfriend/articleshow/57614522.cms	\N	sports-news	\N	2017-03-14
109	samayam		/sports-news/cricket/kambli-cries-as-india-crash-out/articleshow/57615142.cms	\N	sports-news	\N	2017-03-14
110	samayam	ధోనీ తలరాతను ఆ టోర్నీ డిసైడ్ చేస్తుంది..!	/sports-news/cricket/ms-dhonis-sole-focus-is-on-icc-champions-trophy-2017/articleshow/57625361.cms	\N	sports-news	\N	2017-03-14
111	samayam	కోచ్‌గా కుంబ్లేకు ఇదే చివరి సిరీస్?	/sports-news/cricket/anil-kumble-to-become-team-director-rahul-dravid-to-become-coach-report/articleshow/57606575.cms	\N	sports-news	\N	2017-03-14
112	samayam		/sports-news/cricket/bangladesh-batsman-gets-clean-bowled-still-takes-drs-review/articleshow/57606050.cms	\N	sports-news	\N	2017-03-14
113	samayam	కోహ్లి పని అయిపోయింది.. రెచ్చగొట్టిన జాన్సన్	/sports-news/cricket/virat-kohli-is-frustrated-as-he-has-hasnt-scored-runs/articleshow/57612739.cms	\N	sports-news	\N	2017-03-14
114	samayam		/sports-news/cricket/vvs-laxman-dravid-transform-eden-gardens-into-cricketing-heaven/articleshow/57626446.cms	\N	sports-news	\N	2017-03-14
115	samayam	బౌల్డ్ అయినా రివ్యూ, సిక్సర్ బాదితే అవుటని సంబరాలు	/sports-news/cricket/bangladesh-batsman-gets-clean-bowled-still-takes-drs-review/articleshow/57606050.cms	\N	sports-news	\N	2017-03-14
116	samayam		/sports-news/cricket/shivnarine-chanderpaul-son-hit-fifties-in-same-first-class-tie/articleshow/57623712.cms	\N	sports-news	\N	2017-03-14
117	samayam	మన అశ్విన్ మళ్లీ నెం.1 అయ్యాడోచ్..!	/sports-news/cricket/ashwin-reclaims-no-1-test-ranking-for-all-rounders/articleshow/57616374.cms	\N	sports-news	\N	2017-03-14
118	samayam	వారెవ్వా లక్కీ.. క్రికెట్‌లో అరుదైన జోడి	/sports-news/cricket/shivnarine-chanderpaul-son-hit-fifties-in-same-first-class-tie/articleshow/57623712.cms	\N	sports-news	\N	2017-03-14
119	samayam		/sports-news/cricket/ms-dhonis-sole-focus-is-on-icc-champions-trophy-2017/articleshow/57625361.cms	\N	sports-news	\N	2017-03-14
120	samayam	​ ఆసీస్ తొడగొడితే.. మన లక్ష్మణ్ పడగొట్టాడు..!	/sports-news/cricket/vvs-laxman-dravid-transform-eden-gardens-into-cricketing-heaven/articleshow/57626446.cms	\N	sports-news	\N	2017-03-14
121	samayam	భారత క్రికెటర్‌ను ఏడిపించిన.. ఈడెన్ చరిత్ర	/sports-news/cricket/kambli-cries-as-india-crash-out/articleshow/57615142.cms	\N	sports-news	\N	2017-03-14
122	samayam	కిమ్‌శర్మ రాకతో.. యువీని ఈడ్చుకొచ్చేసింది	/sports-news/cricket/hazel-keech-leaves-party-due-to-yuvraj-singhs-ex-girlfriend/articleshow/57614522.cms	\N	sports-news	\N	2017-03-14
123	samayam	క్రికెట్ ప్రపంచంలోకి మళ్లీ ఆ గొంతు..?	/sports-news/cricket/harsha-bhogle-may-return-to-host-ipl-matches/articleshow/57629107.cms	\N	sports-news	\N	2017-03-14
124	samayam		/sports-news/cricket/ashwin-reclaims-no-1-test-ranking-for-all-rounders/articleshow/57616374.cms	\N	sports-news	\N	2017-03-14
125	samayam		/sports-news/cricket/harsha-bhogle-may-return-to-host-ipl-matches/articleshow/57629107.cms	\N	sports-news	\N	2017-03-14
126	samayam	ఆ ఫోన్లు అమ్ముకోవచ్చు: ఢిల్లీ హైకోర్టు	/business/business-news/high-court-allows-intex-to-sell-aqua-brand-mobile-phones/articleshow/57618493.cms	\N	business	\N	2017-03-14
127	samayam	బంగారు రుణాలపై ఆర్బీఐ మరో సంచలన ప్రకటన!	/business/business-news/-nbfc-cash-loan-against-gold-restricted-to-rs-25000-rbi/articleshow/57561883.cms	\N	business	\N	2017-03-14
128	samayam		/business/business-news/airtel-to-offer-up-to-30gb-free-4g-data-to-postpaid-users/articleshow/57616977.cms	\N	business	\N	2017-03-14
129	samayam		/business/business-news/reliance-jio-working-with-google-to-launch-affordable-4g-phone-report/articleshow/57629502.cms	\N	business	\N	2017-03-14
130	samayam		/business/business-news/todays-gold-prices-in-bullian-market/articleshow/57579742.cms	\N	business	\N	2017-03-14
131	samayam		/business/business-news/reliance-jio-effect-reliance-communications-offers-1gb-4g-data-for-rs-49/articleshow/57575684.cms	\N	business	\N	2017-03-14
132	samayam	తక్కువ ధరకే జియో-గూగుల్ 4జీ ఫోన్!	/business/business-news/reliance-jio-working-with-google-to-launch-affordable-4g-phone-report/articleshow/57629502.cms	\N	business	\N	2017-03-14
133	samayam		/business/business-news/-nbfc-cash-loan-against-gold-restricted-to-rs-25000-rbi/articleshow/57561883.cms	\N	business	\N	2017-03-14
134	samayam		/business/business-news/chinese-smartphone-brands-too-love-cricket/articleshow/57556025.cms	\N	business	\N	2017-03-14
135	samayam	బీఎస్ఎన్‌ఎల్ బంపర్ ఆఫర్లు!	/business/business-news/bsnl-announces-holi-offer-to-give-7gb-data/articleshow/57617721.cms	\N	business	\N	2017-03-14
136	samayam	ఎయిర్‌టెల్ ఉచిత 30జీబీ 4జీ డాటా ఆఫర్!	/business/business-news/airtel-to-offer-up-to-30gb-free-4g-data-to-postpaid-users/articleshow/57616977.cms	\N	business	\N	2017-03-14
137	samayam	రెండు నెలల కనిష్ఠానికి బంగారం ధర!	/business/business-news/todays-gold-prices-in-bullian-market/articleshow/57579742.cms	\N	business	\N	2017-03-14
138	samayam	రూ. 49కే రిలయన్స్ 1జీబీ 4జీ డాటా!	/business/business-news/reliance-jio-effect-reliance-communications-offers-1gb-4g-data-for-rs-49/articleshow/57575684.cms	\N	business	\N	2017-03-14
139	samayam		/business/business-news/high-court-allows-intex-to-sell-aqua-brand-mobile-phones/articleshow/57618493.cms	\N	business	\N	2017-03-14
140	samayam	కొత్త రూ.10 నోట్లు త్వరలో చెలామణిలోకి...!	/business/business-news/reserve-bank-of-india-to-issue-new-rs-10-notes/articleshow/57567491.cms	\N	business	\N	2017-03-14
141	samayam		/business/business-news/reserve-bank-of-india-to-issue-new-rs-10-notes/articleshow/57567491.cms	\N	business	\N	2017-03-14
142	samayam	క్రికెట్‌పై ప్రేమ ఒలకబోస్తున్న చైనా బ్రాండ్లు!	/business/business-news/chinese-smartphone-brands-too-love-cricket/articleshow/57556025.cms	\N	business	\N	2017-03-14
143	samayam		/business/business-news/paytm-makes-a-u-turn-on-credit-card-fee/articleshow/57570669.cms	\N	business	\N	2017-03-14
144	samayam	క్రెడిట్ కార్డు ఫీజుపై వెనక్కి తగ్గిన పేటీఎం	/business/business-news/paytm-makes-a-u-turn-on-credit-card-fee/articleshow/57570669.cms	\N	business	\N	2017-03-14
145	samayam		/business/business-news/bsnl-announces-holi-offer-to-give-7gb-data/articleshow/57617721.cms	\N	business	\N	2017-03-14
146	greatandhra	బాలయ్యతో బిజినెస్‌ మేన్‌-2	http://epaper.greatandhra.com	\N	hotnews	\N	2017-03-14
147	greatandhra	ఈ ‘సితార’కు ఏమయ్యింది?	http://telugu.greatandhra.com/movies/movie-gossip/ee-sitara-ku-emayyindi-78862.html	\N	hotnews	\N	2017-03-14
148	greatandhra	జూన్‌ నుంచి జనసేన 'షో'.!	http://telugu.greatandhra.com/politics/political-news/june-nunchi-jana-sena-show-78867.html	\N	hotnews	\N	2017-03-14
149	greatandhra	జగన్ మళ్లీ దొరికాడు	http://telugu.greatandhra.com/politics/gossip/jagan-malli-dorikadu-78864.html	\N	hotnews	\N	2017-03-14
150	greatandhra	మురుగదాస్ ను పక్కనపెట్టి త్రివిక్రమ్ తో...	http://telugu.greatandhra.com/movies/movie-news/muragadasu-nu-pakanapetti-trivikram-tho-78858.html	\N	hotnews	\N	2017-03-14
151	greatandhra	'నిప్పు' లాంటి రాజకీయమిది.!	http://telugu.greatandhra.com/politics/political-news/nippu-lanti-rajakeeyamidi-78865.html	\N	hotnews	\N	2017-03-14
152	greatandhra	క్రిష్ తన ట్రేడ్ మార్క్ వదిలేసినట్టేనా	http://telugu.greatandhra.com/movies/movie-gossip/krish-thana-tred-mark-vadilesinatlena-78855.html	\N	hotnews	\N	2017-03-14
153	greatandhra	నాగ్ సినిమాలో అనుపమ	http://telugu.greatandhra.com/movies/movie-gossip/nag-cinema-lo-anupama-78861.html	\N	hotnews	\N	2017-03-14
154	greatandhra	భూమా సంతాప తీర్మానమా? జగన్ బురద తీర్మానమా?	http://telugu.greatandhra.com/politics/gossip/tdp-pelting-stones-on-jagan-in-assembly-78860.html	\N	hotnews	\N	2017-03-14
155	greatandhra	అన్నీ పెళ్లి తర్వాతే అంటున్న సమంత	http://telugu.greatandhra.com/movies/movie-news/anei-pelli-taravatha-antuna-samantha-78859.html	\N	hotnews	\N	2017-03-14
156	greatandhra	చంద్రబాబు, జగన్.. ఇక మారరా.?	http://telugu.greatandhra.com/politics/political-news/chandrababu-jagan-ika-marara-78856.html	\N	hotnews	\N	2017-03-14
157	greatandhra	ఆ వెకిలి చేష్టలు.. నాకు తెలీదు: రిచా	http://telugu.greatandhra.com/movies/movie-news/aa-vekili-chestalu-naaku-teliyadu-richa-78857.html	\N	hotnews	\N	2017-03-14
158	greatandhra	ఈ పిల్ల రూటే సెపరేటు	http://telugu.greatandhra.com/movies/movie-news/ee-pilla-rote-saparetu-78854.html	\N	hotnews	\N	2017-03-14
159	greatandhra	దీని పరమార్థం ఏమిటో మోడీ భక్తులే చెప్పాలి!	http://telugu.greatandhra.com/politics/gossip/bhakths-can-tell-the-logic-78851.html	\N	hotnews	\N	2017-03-14
160	greatandhra	ఆ గూటి పిట్టే	http://telugu.greatandhra.com/movies/movie-news/aa-gooti-pitte-78852.html	\N	hotnews	\N	2017-03-14
161	greatandhra	ఈ 'జున్ను' ఏంటి అఖిల్..?	http://telugu.greatandhra.com/movies/movie-gossip/ee-junnu-enti-akhil-78853.html	\N	hotnews	\N	2017-03-14
162	greatandhra	పాపం మాయ: దళితరత్నానికి ఇదేం కష్టం!	http://telugu.greatandhra.com/politics/political-news/maya-political-carries-in-danger--78850.html	\N	hotnews	\N	2017-03-14
163	greatandhra	కాంగ్రెస్ పీఎం అభ్యర్థిగా ఆయన.. బాగుంటాడా?	http://telugu.greatandhra.com/politics/political-news/new-pm-face-in-congress-78849.html	\N	hotnews	\N	2017-03-14
164	greatandhra	అన్న విలన్ తమ్ముడికి హిట్టిస్తాడా?	http://telugu.greatandhra.com/movies/movie-gossip/anna-villon-tammudiki-hit-isthada-78847.html	\N	hotnews	\N	2017-03-14
165	greatandhra	'కాటమరాయుడు' నవ్వులు - కండిషన్స్‌ అప్లయ్‌.!	http://telugu.greatandhra.com/movies/movie-news/katamarayudu-navvulu-conditions-apply-78848.html	\N	hotnews	\N	2017-03-14
166	greatandhra	దిల్ రాజు స్టూడెంట్ ఫ్యామిలీ మూవీ	http://telugu.greatandhra.com/movies/movie-news/dil-raju-student-family-movie-78842.html	\N	hotnews	\N	2017-03-14
167	greatandhra	కేసీఆర్‌ కిట్టు.. పబ్లిసిటీ అదిరేటట్టు	http://telugu.greatandhra.com/politics/gossip/kcr-kittu-publicity-adiretattu-78846.html	\N	hotnews	\N	2017-03-14
168	greatandhra	పవన్‌ ఔట్‌.. చంద్రబాబు ఏమంటారో.!	http://telugu.greatandhra.com/politics/gossip/pawan-out-chandrababu-emantaro-78869.html	\N	Gossip	\N	2017-03-14
169	greatandhra	జగన్ మళ్లీ దొరికాడు	http://telugu.greatandhra.com/politics/gossip/jagan-malli-dorikadu-78864.html	\N	Gossip	\N	2017-03-14
170	greatandhra	భూమా సంతాప తీర్మానమా? జగన్ బురద తీర్మానమా?	http://telugu.greatandhra.com/politics/gossip/tdp-pelting-stones-on-jagan-in-assembly-78860.html	\N	Gossip	\N	2017-03-14
171	greatandhra	దీని పరమార్థం ఏమిటో మోడీ భక్తులే చెప్పాలి!	http://telugu.greatandhra.com/politics/gossip/bhakths-can-tell-the-logic-78851.html	\N	Gossip	\N	2017-03-14
172	greatandhra	కేసీఆర్‌ కిట్టు.. పబ్లిసిటీ అదిరేటట్టు	http://telugu.greatandhra.com/politics/gossip/kcr-kittu-publicity-adiretattu-78846.html	\N	Gossip	\N	2017-03-14
173	greatandhra	టీడీపీ రాజకీయమే..భూమాను బలితీసుకుందా?	http://telugu.greatandhra.com/politics/gossip/tdp-causes-for-bhumas-death--78820.html	\N	Gossip	\N	2017-03-14
174	greatandhra	యూపీలో విజయం...'చిన్నమ్మ'లో విశ్వాసం...!	http://telugu.greatandhra.com/politics/gossip/up-lo-vijayamchinama-li-vishvasam-78812.html	\N	Gossip	\N	2017-03-14
175	greatandhra	పన్నులెగ్గొట్టిన పెద్దోళ్లు	http://telugu.greatandhra.com/politics/gossip/pannuleggottina-peddollu-78805.html	\N	Gossip	\N	2017-03-14
176	greatandhra	'గ్రేట్‌ ఎస్కేప్‌' వెనుక రహస్యం?	http://telugu.greatandhra.com/politics/gossip/great-escap-venuka-rahasyam-78801.html	\N	Gossip	\N	2017-03-14
177	greatandhra	సెంటిమెంట్: యూపీ విజయం చాలా డేంజర్ మోడీజీ	http://telugu.greatandhra.com/politics/gossip/up-winning-anti-sentiment--78790.html	\N	Gossip	\N	2017-03-14
178	greatandhra	పవన్ స్వరం మార్చేస్తారా?	http://telugu.greatandhra.com/politics/gossip/pawan-swaram-marchesthara-78770.html	\N	Gossip	\N	2017-03-14
179	greatandhra	ఆర్‌కే నగర్‌లో చిన్నమ్మపై ఇంకా ఆగ్రహమే...!	http://telugu.greatandhra.com/politics/gossip/rk-nagar-lo-chinama-pai-enka-agrahama-78768.html	\N	Gossip	\N	2017-03-14
180	greatandhra	బాలయ్య చూపు.. ఎంపీ సీటు వైపా?	http://telugu.greatandhra.com/politics/gossip/balayya-choopu-mp-setu-vaipaa-78748.html	\N	Gossip	\N	2017-03-14
181	greatandhra	జైల్లో జీవితం...పార్టీలో రాజయోగం...!	http://telugu.greatandhra.com/politics/gossip/jailo-jevitham-party-lo-rajayogam-78743.html	\N	Gossip	\N	2017-03-14
182	greatandhra	కేసీఆర్- చంద్రబాబు మధ్య అద్గదీ అసలుతేడా?	http://telugu.greatandhra.com/politics/gossip/the-difference-between-kcr-and-chandrababu-78738.html	\N	Gossip	\N	2017-03-14
183	greatandhra	సూపర్‌ ట్విస్ట్‌: ఓటుకు 'పోటు'.!	http://telugu.greatandhra.com/politics/gossip/super-twist-vote-ki-potu-78730.html	\N	Gossip	\N	2017-03-14
184	greatandhra	సుజన హవా మాయమైనట్లేనా?	http://telugu.greatandhra.com/politics/gossip/sujana-hawa-mayamainatlena-78718.html	\N	Gossip	\N	2017-03-14
185	greatandhra	నారా లోకేష్.. ఐరన్ లెగ్గా…?!	http://telugu.greatandhra.com/politics/gossip/naralokesh-ironleg-78714.html	\N	Gossip	\N	2017-03-14
186	greatandhra	ఓటుకు నోటు.. ఈ మౌనమెందుకట.?	http://telugu.greatandhra.com/politics/gossip/vote-ki-note-ee-mounamendukata-78713.html	\N	Gossip	\N	2017-03-14
187	greatandhra	అనుచిత వ్యాఖ్యలు.. బాబుపై సీఐఏ దృష్టి?	http://telugu.greatandhra.com/politics/gossip/cia-eye-on-cbn-78712.html	\N	Gossip	\N	2017-03-14
188	greatandhra	యూపీ ఫలితాలు.. ఫైనల్ ప్రిడిక్షన్స్ ఏం చెబుతున్నాయి?	http://telugu.greatandhra.com/politics/gossip/up-election-results-78711.html	\N	Gossip	\N	2017-03-14
189	greatandhra	కోదండరామ్‌ కథ కంచికేనా.?	http://telugu.greatandhra.com/politics/gossip/kodandaram-katha-kanchikena-78698.html	\N	Gossip	\N	2017-03-14
190	greatandhra	'దేశం' క్లిష్ట పరిస్థితుల్లో వుంది	http://telugu.greatandhra.com/politics/gossip/desam-klishta-paristhithullo-vundi-78676.html	\N	Gossip	\N	2017-03-14
191	greatandhra	మహిళా జైలుకు తరలిస్తే మంత్రులు మాయమవుతారా?	http://telugu.greatandhra.com/politics/gossip/mahila-jailku-taralista-mantrulu-mayamavutara-78669.html	\N	Gossip	\N	2017-03-14
192	greatandhra	అయితే జగన్ పై కేసుల కథేంటి?	http://telugu.greatandhra.com/politics/gossip/babu-about-supreme-notice--78657.html	\N	Gossip	\N	2017-03-14
193	greatandhra	ఏపీలో ప్రోగ్రామ్.. వెంకయ్య మిస్.. అందుకేనా..?	http://telugu.greatandhra.com/politics/gossip/venkaih-missing-for-assembly-building-inauguration-78656.html	\N	Gossip	\N	2017-03-14
194	greatandhra	రజనీ రావట్లేదు… కమల్ కు అంత సీనుందా?	http://telugu.greatandhra.com/politics/gossip/kamal-to-enter-politics--78629.html	\N	Gossip	\N	2017-03-14
195	greatandhra	లోకేష్‌కు ఎమ్మెల్సీ పదవి-చంద్రబాబు చాకచక్యం	http://telugu.greatandhra.com/politics/gossip/lokesh-mlc-padavi-chandrababu-chakachakyam-78624.html	\N	Gossip	\N	2017-03-14
196	greatandhra	సూపర్‌ స్టార్‌ పొలిటికల్‌ స్టార్‌ అవుతాడా.?	http://telugu.greatandhra.com/politics/gossip/super-star-political-star-avutada-78622.html	\N	Gossip	\N	2017-03-14
197	greatandhra	బాబు కమ్మోళ్ల కొమ్ముకాయడం లేదట	http://telugu.greatandhra.com/politics/gossip/babu-kammolla-kommu-kayada-ledata-78620.html	\N	Gossip	\N	2017-03-14
198	greatandhra	ఈ ‘సితార’కు ఏమయ్యింది?	http://telugu.greatandhra.com/movies/movie-gossip/ee-sitara-ku-emayyindi-78862.html	\N	Movie News	\N	2017-03-14
199	greatandhra	నాగ్ సినిమాలో అనుపమ	http://telugu.greatandhra.com/movies/movie-gossip/nag-cinema-lo-anupama-78861.html	\N	Movie News	\N	2017-03-14
200	greatandhra	అన్నీ పెళ్లి తర్వాతే అంటున్న సమంత	http://telugu.greatandhra.com/movies/movie-news/anei-pelli-taravatha-antuna-samantha-78859.html	\N	Movie News	\N	2017-03-14
201	greatandhra	మురుగదాస్ ను పక్కనపెట్టి త్రివిక్రమ్ తో...	http://telugu.greatandhra.com/movies/movie-news/muragadasu-nu-pakanapetti-trivikram-tho-78858.html	\N	Movie News	\N	2017-03-14
202	greatandhra	ఆ వెకిలి చేష్టలు.. నాకు తెలీదు: రిచా	http://telugu.greatandhra.com/movies/movie-news/aa-vekili-chestalu-naaku-teliyadu-richa-78857.html	\N	Movie News	\N	2017-03-14
203	greatandhra	క్రిష్ తన ట్రేడ్ మార్క్ వదిలేసినట్టేనా	http://telugu.greatandhra.com/movies/movie-gossip/krish-thana-tred-mark-vadilesinatlena-78855.html	\N	Movie News	\N	2017-03-14
204	greatandhra	ఈ పిల్ల రూటే సెపరేటు	http://telugu.greatandhra.com/movies/movie-news/ee-pilla-rote-saparetu-78854.html	\N	Movie News	\N	2017-03-14
205	greatandhra	ఈ 'జున్ను' ఏంటి అఖిల్..?	http://telugu.greatandhra.com/movies/movie-gossip/ee-junnu-enti-akhil-78853.html	\N	Movie News	\N	2017-03-14
206	greatandhra	ఆ గూటి పిట్టే	http://telugu.greatandhra.com/movies/movie-news/aa-gooti-pitte-78852.html	\N	Movie News	\N	2017-03-14
207	greatandhra	'కాటమరాయుడు' నవ్వులు - కండిషన్స్‌ అప్లయ్‌.!	http://telugu.greatandhra.com/movies/movie-news/katamarayudu-navvulu-conditions-apply-78848.html	\N	Movie News	\N	2017-03-14
208	greatandhra	అన్న విలన్ తమ్ముడికి హిట్టిస్తాడా?	http://telugu.greatandhra.com/movies/movie-gossip/anna-villon-tammudiki-hit-isthada-78847.html	\N	Movie News	\N	2017-03-14
209	greatandhra	సన్నీలియోన్‌ అదరగొట్టేసిందంతే	http://telugu.greatandhra.com/movies/movie-news/sunny-leone-adragottesindante-78845.html	\N	Movie News	\N	2017-03-14
210	greatandhra	టాలీవుడ్ బ్యూటీ.. బాలీవుడ్ డ్రీమ్స్...	http://telugu.greatandhra.com/movies/movie-gossip/tollywood-beauity-bollywood-dreams-78844.html	\N	Movie News	\N	2017-03-14
211	greatandhra	కమల్‌హాసన్‌ ప్రశ్నిస్తూనే వుంటాడట.!	http://telugu.greatandhra.com/movies/movie-news/kamalhassan-prasnisthoone-vuntadata-78843.html	\N	Movie News	\N	2017-03-14
212	greatandhra	దిల్ రాజు స్టూడెంట్ ఫ్యామిలీ మూవీ	http://telugu.greatandhra.com/movies/movie-news/dil-raju-student-family-movie-78842.html	\N	Movie News	\N	2017-03-14
213	greatandhra	రోబో 2 కు 110 కోట్లా? బాబోయ్?	http://telugu.greatandhra.com/movies/movie-news/robo-2-ku-110-kotla-baboi-78840.html	\N	Movie News	\N	2017-03-14
214	greatandhra	సుచి లీక్స్ - సుచిత్రకు గీతామాధురి మద్దతు	http://telugu.greatandhra.com/movies/movie-gossip/suchi-leeks-suchitraku-geethamaduri-madathu-78831.html	\N	Movie News	\N	2017-03-14
215	greatandhra	ఈసారి పవన్ కల్యాణ్ కు పోటీగా దిగుతాడట	http://telugu.greatandhra.com/movies/movie-news/esari-pawan-kalyan-ku-potiga-digutadta-78829.html	\N	Movie News	\N	2017-03-14
216	greatandhra	ఈ బ్యాచ్ లో అందరికీ అగ్నిపరీక్షే	http://telugu.greatandhra.com/movies/movie-news/e-batchlo-andariki-agni-parexye-78827.html	\N	Movie News	\N	2017-03-14
217	greatandhra	అమెరికా నుంచి వచ్చేశాడు.. నెక్ట్స్ ఏంటి..?	http://telugu.greatandhra.com/movies/movie-gossip/amerika-nunchi-vaccheshaadu-next-enti-78826.html	\N	Movie News	\N	2017-03-14
218	greatandhra	ఆ నిర్మాత అలా చేసారా?	http://telugu.greatandhra.com/movies/movie-gossip/aa-nirmatha-alaa-chesaara-78825.html	\N	Movie News	\N	2017-03-14
219	greatandhra	నటి కస్తూరి… పడకగది ఆరోపణలు.. తెలుగు హీరోపైనే?	http://telugu.greatandhra.com/movies/movie-gossip/kasturi-sensational-comments--78824.html	\N	Movie News	\N	2017-03-14
220	greatandhra	బ్రాండ్‌ షబానా.!	http://telugu.greatandhra.com/movies/movie-news/brand-shabana-78823.html	\N	Movie News	\N	2017-03-14
221	greatandhra	బాలయ్య అభిమానుల అలక?	http://telugu.greatandhra.com/movies/movie-gossip/balayya-abhimanullo-alaka-78822.html	\N	Movie News	\N	2017-03-14
222	greatandhra	ఆ డీవీడీ తెగ తిరిగిందట	http://telugu.greatandhra.com/movies/movie-gossip/aa-dvd-tega-tirigesindata-78819.html	\N	Movie News	\N	2017-03-14
223	greatandhra	అఖిల్ ఫైట్లకు 20 కోట్లు?	http://telugu.greatandhra.com/movies/movie-gossip/akhil-fight-laku-20-kotlu-78818.html	\N	Movie News	\N	2017-03-14
224	greatandhra	సుచి లీక్స్‌.. సంచలనమా? సంచలనం కోసమా?	http://telugu.greatandhra.com/movies/movie-gossip/suchi-leeks-sanchalanama-sanchalanam-kosama-78817.html	\N	Movie News	\N	2017-03-14
225	greatandhra	ట్యాగ్ లైన్ టైటిల్ గా మారిన వేళ...	http://telugu.greatandhra.com/movies/movie-news/tag-laine-titlega-maarina-vela-78814.html	\N	Movie News	\N	2017-03-14
226	greatandhra	ఈసారి కాటమరాయుడిపై కన్నేసిన సమంత	http://telugu.greatandhra.com/movies/movie-news/esari-katamarayudupai-kannesina-samantha-78813.html	\N	Movie News	\N	2017-03-14
227	greatandhra	రాఖీ లీక్స్‌: ఆ నేను.. నేను కాదు.!	http://telugu.greatandhra.com/movies/movie-news/rakhee-leaks-aa-nenu-nenu-kaadu-78807.html	\N	Movie News	\N	2017-03-14
228	greatandhra	సినిమా రివ్యూ: నగరం	http://telugu.greatandhra.com/movies/reviews/nagaram-cinema-review-78747.html	\N	Reviews	\N	2017-03-14
229	greatandhra	సినిమా రివ్యూ: గుంటూరోడు	http://telugu.greatandhra.com/movies/reviews/gunturodu-telugu-movie-review-78587.html	\N	Reviews	\N	2017-03-14
230	greatandhra	సినిమా రివ్యూ: ద్వారక	http://telugu.greatandhra.com/movies/reviews/dwaraka-telugu-movie-review-78568.html	\N	Reviews	\N	2017-03-14
231	greatandhra	సినిమా రివ్యూ: కిట్టు ఉన్నాడు జాగ్రత్త	http://telugu.greatandhra.com/movies/reviews/kittu-vunadu-jagartha-review-78555.html	\N	Reviews	\N	2017-03-14
232	greatandhra	సినిమా రివ్యూ: విన్నర్‌	http://telugu.greatandhra.com/movies/reviews/winner-telugu-movie-review-78379.html	\N	Reviews	\N	2017-03-14
233	greatandhra	సినిమా రివ్యూ: ఘాజీ	http://telugu.greatandhra.com/movies/reviews/movie-review-ghazi-78201.html	\N	Reviews	\N	2017-03-14
234	greatandhra	సినిమా రివ్యూ: ఓం నమో వెంకటేశాయ	http://telugu.greatandhra.com/movies/reviews/om-namo-venkatesaya-review-78009.html	\N	Reviews	\N	2017-03-14
235	greatandhra	సినిమా రివ్యూ: ఎస్‌ 3 (యముడు 3)	http://telugu.greatandhra.com/movies/reviews/singam-3-telugu-review-77995.html	\N	Reviews	\N	2017-03-14
236	greatandhra	సినిమా రివ్యూ: నేను లోకల్‌	http://telugu.greatandhra.com/movies/reviews/nenu-local-movie-review-77854.html	\N	Reviews	\N	2017-03-14
237	greatandhra	సినిమా రివ్యూ: శతమానం భవతి	http://telugu.greatandhra.com/movies/reviews/satamanam-bhavathi-telugu-review-77361.html	\N	Reviews	\N	2017-03-14
238	greatandhra	ఎమ్బీయస్‌: మెహబూబా కష్టాలు	http://telugu.greatandhra.com/articles/mbs/mehbooba-kastalu-78782.html	\N	MBS Special Articles	\N	2017-03-14
239	greatandhra	ఎమ్బీయస్‌: ప్రజల నాడి	http://telugu.greatandhra.com/articles/mbs/prajala-nadi-78781.html	\N	MBS Special Articles	\N	2017-03-14
240	greatandhra	ఎమ్బీయస్‌: కాశీకి పోయాము రామాహరీ...!	http://telugu.greatandhra.com/articles/mbs/mbs-kaseeki-poyaamu-raamaahari-78626.html	\N	MBS Special Articles	\N	2017-03-14
241	greatandhra	ఎమ్బీయస్‌: అమెరికా యిక భూతాల స్వర్గమేనా?	http://telugu.greatandhra.com/articles/mbs/mbs-america-bootala-swargamena-78595.html	\N	MBS Special Articles	\N	2017-03-14
242	greatandhra	ఎమ్బీయస్‌: డ్రేక్‌ వారసుడికి సాయపడదామా?	http://telugu.greatandhra.com/articles/mbs/dreak-varasudiki-sayapadadaamaa-78539.html	\N	MBS Special Articles	\N	2017-03-14
243	greatandhra	ఎమ్బీయస్‌ : శత్రువుల ఆస్తుల స్వాధీనం	http://telugu.greatandhra.com/articles/mbs/shatruvula-asthulu-swadeenam-78530.html	\N	MBS Special Articles	\N	2017-03-14
244	greatandhra	ఎమ్బీయస్‌ : కిమ్‌ నామ్‌ హత్య	http://telugu.greatandhra.com/articles/mbs/mbs-kim-naam-hathya-78505.html	\N	MBS Special Articles	\N	2017-03-14
245	greatandhra	ఎమ్బీయస్‌: ఇజ్రాయెల్‌ ట్రంప్‌పై పెట్టుకున్న ఆశలు నెరవేరేనా?	http://telugu.greatandhra.com/articles/mbs/trump-isreal-asalu-78485.html	\N	MBS Special Articles	\N	2017-03-14
246	greatandhra	ఎమ్బీయస్‌: ఐసిస్‌ మహిళా కార్యకర్త	http://telugu.greatandhra.com/articles/mbs/iss-mahila-karyakartha-78471.html	\N	MBS Special Articles	\N	2017-03-14
247	greatandhra	ఎమ్బీయస్‌: మనం రాసేదే చరిత్ర	http://telugu.greatandhra.com/articles/mbs/mbs-manam-rasede-charitra-78428.html	\N	MBS Special Articles	\N	2017-03-14
248	greatandhra	ఎమ్బీయస్‌: ట్రంప్‌-రష్యా లవ్‌స్టోరీలో విలన్‌ - డీప్‌ స్టేట్‌	http://telugu.greatandhra.com/articles/mbs/mbs-trump-russia-love-strory-78388.html	\N	MBS Special Articles	\N	2017-03-14
383	samayam		/latest-news/state-news/manipur-governor-invites-bjp-to-form-government-oath-ceremony-tomorrow/articleshow/57633286.cms	\N	latest-news	\N	2017-03-14
249	greatandhra	ఎమ్బీయస్‌: పసుపు విఘ్నేశ్వరుడి తడాఖా	http://telugu.greatandhra.com/articles/mbs/mbs-kodandaram-tadaka-78335.html	\N	MBS Special Articles	\N	2017-03-14
250	greatandhra	ఎమ్బీయస్‌: ముంబయి కార్పోరేషన్‌ ఎవరిది?	http://telugu.greatandhra.com/articles/mbs/mbs-mumbai-corporation-evaridhi-78316.html	\N	MBS Special Articles	\N	2017-03-14
251	greatandhra	ఎమ్బీయస్‌: శశికళ ఎందుకు తొందర పడింది?	http://telugu.greatandhra.com/articles/mbs/mbs-sasikala-enduku-todara-padindi-78264.html	\N	MBS Special Articles	\N	2017-03-14
252	greatandhra	ఎమ్బీయస్‌: తమిళనాట బొమ్మలాట్టం	http://telugu.greatandhra.com/articles/mbs/mbs-tamilnadu-bommalatta-78141.html	\N	MBS Special Articles	\N	2017-03-14
253	greatandhra	ఎమ్బీయస్‌: నాటోకు ట్రంప్‌ స్వస్తి  పలుకుతాడా?	http://telugu.greatandhra.com/articles/mbs/mbs-nto-ku-trump-swasthi-palukutada-78072.html	\N	MBS Special Articles	\N	2017-03-14
254	greatandhra	ఎమ్బీయస్‌: చె గువెరాపై కేరళ బీజేపీలో చర్చ	http://telugu.greatandhra.com/articles/mbs/che-and-bjp-78040.html	\N	MBS Special Articles	\N	2017-03-14
255	greatandhra	ఎమ్బీయస్‌: 'నీవు నేర్పిన విద్యయే, మమతమ్మా'	http://telugu.greatandhra.com/articles/mbs/mbs-nuvvu-nerpina-vidya-78018.html	\N	MBS Special Articles	\N	2017-03-14
256	greatandhra	ఎమ్బీయస్‌:  తమిళనాట కుదిరైయాట్టం	http://telugu.greatandhra.com/articles/mbs/mbs-tamil-kudiraiyatam1-77975.html	\N	MBS Special Articles	\N	2017-03-14
257	greatandhra	ఎమ్బీయస్‌: శ్రీకృష్ణుడు క్షత్రియుడు కాడా?	http://telugu.greatandhra.com/articles/mbs/srikrishnudu-kshariyudu-kada-77812.html	\N	MBS Special Articles	\N	2017-03-14
258	greatandhra	ఎమ్బీయస్‌: డిక్సీ మిషన్‌ వీరులు హీరోలా? విలన్లా?	http://telugu.greatandhra.com/articles/mbs/mbs-hero-and-villain-77760.html	\N	MBS Special Articles	\N	2017-03-14
259	greatandhra	ఎమ్బీయస్‌: జల్లికట్టు ఉద్యమం సాధించినదేమిటి?	http://telugu.greatandhra.com/articles/mbs/mbs-jallikattu-sadinchidemti-77725.html	\N	MBS Special Articles	\N	2017-03-14
260	greatandhra	ఎమ్బీయస్‌: ఎన్టీయార్‌ మరణం	http://telugu.greatandhra.com/articles/mbs/mbs-ntr-maranam-77707.html	\N	MBS Special Articles	\N	2017-03-14
261	greatandhra	ఎమ్బీయస్‌: ఒఎన్‌జిసి నెత్తిన గుజరాత్‌ బండ	http://telugu.greatandhra.com/articles/mbs/mbs-ongc-gujarat-77559.html	\N	MBS Special Articles	\N	2017-03-14
262	greatandhra	ఎమ్బీయస్‌: అఖిలేశ్‌కే సైకిల్‌!	http://telugu.greatandhra.com/articles/mbs/mbs-akshilesh-cycle-77535.html	\N	MBS Special Articles	\N	2017-03-14
263	greatandhra	ఎమ్బీయస్‌: నగదురహితం... నడిచేనా? - 2/2	http://telugu.greatandhra.com/articles/mbs/mbs-nagadu-part-2-77306.html	\N	MBS Special Articles	\N	2017-03-14
264	greatandhra	ఎమ్బీయస్‌: నగదురహితం... నడిచేనా? - 1/2	http://telugu.greatandhra.com/articles/mbs/mbs-nagadu-rahita-1-77278.html	\N	MBS Special Articles	\N	2017-03-14
265	greatandhra	ఎమ్బీయస్‌: కేరళలో కాంగ్రెసు కుమ్ములాటలు	http://telugu.greatandhra.com/articles/mbs/mbs-congress-infighting-77113.html	\N	MBS Special Articles	\N	2017-03-14
266	greatandhra	ఎమ్బీయస్‌: ఇదా తీపి కబురు?	http://telugu.greatandhra.com/articles/mbs/mbs-ida-teepi-kaburu-77083.html	\N	MBS Special Articles	\N	2017-03-14
267	greatandhra	ఎమ్బీయస్‌: షీలా దీక్షిత్‌ గతి ఏమవుతుంది?	http://telugu.greatandhra.com/articles/mbs/-77071.html	\N	MBS Special Articles	\N	2017-03-14
268	greatandhra	2019లో పెళ్లి చేసుకుంటా..రాజ్ తరుణ్	http://telugu.greatandhra.com/movies/interviews/2019-lo-pelli-chesukunaraj-tarun-78508.html	\N	Interviews	\N	2017-03-14
269	greatandhra	భక్తిరస సినిమాలు నిర్మించడం మా భాగ్యం	http://telugu.greatandhra.com/movies/interviews/bhaktirasa-cinemalu-nirminchadam-maa-bhagyam-77863.html	\N	Interviews	\N	2017-03-14
270	greatandhra	ఈ జోరు..ఈ బజ్ ఊహించలేదు..మెగాస్టార్	http://telugu.greatandhra.com/movies/interviews/-ee-joru-ee-buzz-voohincha-ledu-megastar-77292.html	\N	Interviews	\N	2017-03-14
271	greatandhra	న్యూ ఇయర్ లో నాకు చాలా పెద్ద షాక్ - పృధ్వీ	http://telugu.greatandhra.com/movies/interviews/new-year-lo-naku-chala-pedda-shockpridvi-77139.html	\N	Interviews	\N	2017-03-14
272	greatandhra	టాలీవుడ్ లో నిర్మాతలు లేరు	http://telugu.greatandhra.com/movies/interviews/tollywood-lo-nirmathalu-leru-76958.html	\N	Interviews	\N	2017-03-14
273	greatandhra	ఇంటర్వూ: వంగవీటి బయోపిక్ కాదు	http://telugu.greatandhra.com/movies/interviews/vangaveeti-bio-pic-kadu-76937.html	\N	Interviews	\N	2017-03-14
274	greatandhra	నేను కమెడియన్ కావాలనుకోలేదు	http://telugu.greatandhra.com/movies/interviews/nenu-comedian-kavalanu-koledu-76802.html	\N	Interviews	\N	2017-03-14
275	greatandhra	ఈ సినిమా తర్వాత  ఇక పెళ్లే - నిఖిల్	http://telugu.greatandhra.com/movies/interviews/ee-cinema-tarvatha-ika-pelle-nikhil-75909.html	\N	Interviews	\N	2017-03-14
276	greatandhra	నేను నా క్యారెక్టర్లు మానను-శ్రీనివాసరెడ్డి	http://telugu.greatandhra.com/movies/interviews/nenu-naa-characters-mananu-srinivasa-reddy-75864.html	\N	Interviews	\N	2017-03-14
277	greatandhra	కాష్మోరా సక్సెస్‌ చేసిన ప్రేక్షకులకు థాంక్స్‌: కార్తీ	http://telugu.greatandhra.com/movies/interviews/kashmora-cinema-succes-chesina-audience-ki-thanks-75555.html	\N	Interviews	\N	2017-03-14
278	greatandhra	మల్టీ స్టారర్లు చేయడం నాకు అంత ఇష్టం  వుండదు	http://telugu.greatandhra.com/movies/interviews/malti-starer-lu-cheyadam-naaku-antha-istham-undadu-75342.html	\N	Interviews	\N	2017-03-14
279	greatandhra	నటుడిగా నేనేంటో ఇజమ్ చూపిస్తుంది	http://telugu.greatandhra.com/movies/interviews/natudigaa-nenento-isam-choopisthundi-75209.html	\N	Interviews	\N	2017-03-14
280	greatandhra	అభిమానులను దృష్టిలో వుంచుకునే సినిమాలు	http://telugu.greatandhra.com/movies/interviews/abhimanulanu-drushtilo-vunchukune-cinemalu-74680.html	\N	Interviews	\N	2017-03-14
281	greatandhra	నేనేవర్నీ సినిమాలు చేయమని అడగలేదు	http://telugu.greatandhra.com/movies/interviews/nenevarni-cinemalu-cheyamani-adagaledu-73990.html	\N	Interviews	\N	2017-03-14
282	greatandhra	మంచి కథ కోసం మనమంతా - చంద్రశేఖర్ యేలేటి	http://telugu.greatandhra.com/movies/interviews/manchi-katha-kosam-manamantha-chandrasekhar-yeleti-73304.html	\N	Interviews	\N	2017-03-14
283	greatandhra	నాకు నప్పే సబ్జెక్ట్ లే చేస్తాను - శిరీష్	http://telugu.greatandhra.com/movies/interviews/naku-nappe-subject-le-chesthanu-sirish-73262.html	\N	Interviews	\N	2017-03-14
284	greatandhra	నాకు బాస్ చైర్లో కూర్చోవడం ఇష్టం-నీహారిక	http://telugu.greatandhra.com/movies/interviews/naku-boss-chair-lo-kurchodam-ishtamniharika-72230.html	\N	Interviews	\N	2017-03-14
285	greatandhra	ఓ మంచి ప్రయత్నం చేసాం	http://telugu.greatandhra.com/movies/interviews/o-manchi-prayatnam-chesam-71678.html	\N	Interviews	\N	2017-03-14
286	greatandhra	భయమేసిందిగానీ, బాలీవుడ్‌ ఆదరించింది: సుధీర్‌బాబు	http://telugu.greatandhra.com/movies/interviews/bayamesindi-kani-bollywood-aarinchindi-71391.html	\N	Interviews	\N	2017-03-14
287	greatandhra	పవన్ చెప్పింది ఒకటి చేసింది ఒకటి	http://telugu.greatandhra.com/movies/interviews/pawan-cheppindi-okakti-chesindi-okati-71317.html	\N	Interviews	\N	2017-03-14
288	greatandhra	అవును.. మెగా మేనల్లుణ్ణి నేను: సాయి ధరమ్ తేజ	http://telugu.greatandhra.com/movies/interviews/avunumega-menallunni-nenusai-dharam-teja-71068.html	\N	Interviews	\N	2017-03-14
289	greatandhra	వైవిధ్యమైన సినిమాలకే ఇక ప్రాధాన్యత	http://telugu.greatandhra.com/movies/interviews/vaividhya-maina-cinemalake-ika-pradhanyatha-70940.html	\N	Interviews	\N	2017-03-14
290	greatandhra	బోయపాటి తరహాలో బన్నీ స్టయిల్ సినిమా	http://telugu.greatandhra.com/movies/interviews/boyapati-tarahalo-bunny-style-cinema-70798.html	\N	Interviews	\N	2017-03-14
291	greatandhra	‘సావిత్రి’ పేరు నిలబెట్టే సినిమా	http://telugu.greatandhra.com/movies/interviews/savithri-peru-nilabette-cinema-70293.html	\N	Interviews	\N	2017-03-14
292	greatandhra	నిర్మాణం వేరు.. డిస్ట్రిబ్యూషన్ వేరు	http://telugu.greatandhra.com/movies/interviews/nirmanam-veru-distribustion-veru-69658.html	\N	Interviews	\N	2017-03-14
293	greatandhra	అలామొదలై..ఇలా సాగుతోంది..నందినీ రెడ్డి	http://telugu.greatandhra.com/movies/interviews/ala-modalai-ilasaguthondinandini-reddy-69559.html	\N	Interviews	\N	2017-03-14
294	greatandhra	మంచి నటుడిగా ఎదగాలి..అడవి శేష్	http://telugu.greatandhra.com/movies/interviews/manchi-natudiga-edagaliadavi-sesh-69467.html	\N	Interviews	\N	2017-03-14
295	greatandhra	ఓ మంచి నటుడిగా గుర్తుండిపోవాలి..సునీల్	http://telugu.greatandhra.com/movies/interviews/o-manchi-natudi-gaa-gurthundi-povalisuneel-69306.html	\N	Interviews	\N	2017-03-14
296	greatandhra	వంగవీటి రాధా..తెలుగులో నా ఆఖరు సినిమా	http://telugu.greatandhra.com/movies/interviews/vangaveeti-radhatelugu-lo-naa-akharu-cinema-69147.html	\N	Interviews	\N	2017-03-14
297	greatandhra	గరమ్ గరమ్ చాయ్...గరం....ఆది	http://telugu.greatandhra.com/movies/interviews/garam-garam-chaigaramaadi-69125.html	\N	Interviews	\N	2017-03-14
298	greatandhra	ఇకపై చకచకా సినిమాలు..బెల్లంకొండ శ్రీనివాస్	http://telugu.greatandhra.com/movies/interviews/ikapai-chaka-chaka-cinemalubellamkonda-srinivas-68995.html	\N	Interviews	\N	2017-03-14
299	greatandhra	ఈ తరం ప్రేక్షకుల సినిమా స్పీడున్నోడు	http://telugu.greatandhra.com/movies/interviews/ee-taram-prekshakul-cinema-speedunnodu-68952.html	\N	Interviews	\N	2017-03-14
300	greatandhra	27 వచ్చాకే పెళ్లి..రాజ్ తరుణ్	http://telugu.greatandhra.com/movies/interviews/27-vachake-pelliraj-tarun-68859.html	\N	Interviews	\N	2017-03-14
301	greatandhra	కొత్తదనం ఎంతవరకో అంతవరకే వుండాలి - శ్రీవాస్	http://telugu.greatandhra.com/movies/interviews/kottadanam-entha-varakoanthavarake-undalisrivas-68711.html	\N	Interviews	\N	2017-03-14
302	greatandhra	'సోగ్గాడే ..' అన్నీ ఎలిమెంట్స్‌ ఉన్న ఫ్యామిలీ ఎంటర్‌టైనర్‌	http://telugu.greatandhra.com/movies/interviews/soggade-anni-elements-vunna-family-entertainer-68553.html	\N	Interviews	\N	2017-03-14
303	greatandhra	నేను బాగా స్పిరుట్యువల్... ఎన్టీఆర్	http://telugu.greatandhra.com/movies/interviews/nenu-baga-spirituvalntr-68495.html	\N	Interviews	\N	2017-03-14
304	greatandhra	నేను పోటీలకు అతీతం..నాగార్జున	http://telugu.greatandhra.com/movies/interviews/nenu-potilaku-ateetamnagarjuna-68458.html	\N	Interviews	\N	2017-03-14
305	greatandhra	‘స్పీడున్నోడు’ మరో కమర్షియల్ ఎంటర్ టైనర్..	http://telugu.greatandhra.com/movies/interviews/speed-vunnodu-moro-famiy-entertainer-68262.html	\N	Interviews	\N	2017-03-14
306	greatandhra	సినిమా నిర్మాణం నా అభిరుచి	http://telugu.greatandhra.com/movies/interviews/cinema-nirmanam-naa-abhiruchi-67670.html	\N	Interviews	\N	2017-03-14
307	greatandhra	బెంగాల్ టైగర్ కమర్షియల్ హిట్ గ్యారంటీ	http://telugu.greatandhra.com/movies/interviews/bengal-tiger-commercial-hit-guarantee-67668.html	\N	Interviews	\N	2017-03-14
308	greatandhra	జనానికి ఏం కావాలో తెలుసంతే	http://telugu.greatandhra.com/movies/interviews/jananiki-em-kavalo-telusanthe-67658.html	\N	Interviews	\N	2017-03-14
309	greatandhra	సిస్టర్ హీరోయిన్ అయితే నా కెరీర్ పోతుందన్నారు	http://telugu.greatandhra.com/movies/interviews/sister-heroine-ayithe-naa-career-potundannaru-66403.html	\N	Interviews	\N	2017-03-14
310	greatandhra	వరుణ్ తేజ గురించి మాట్లాడాకే నా గురించి- క్రిష్	http://telugu.greatandhra.com/movies/interviews/varun-tej-gurinchi-matladake-naa-gurunchikrish-66390.html	\N	Interviews	\N	2017-03-14
311	greatandhra	ఈ క్యారెక్టర్‌ చేయడం అవసరమా అని చాలామందన్నారు	http://telugu.greatandhra.com/movies/interviews/bunny-interview-on-rudramadevi-66027.html	\N	Interviews	\N	2017-03-14
312	greatandhra	హరీష్‌ శంకర్‌ - సాయిధరమ్‌ తేజ్‌ ఇంటర్వ్యూ	http://telugu.greatandhra.com/movies/interviews/harish-shankar-sai-dharma-tej-interview-65446.html	\N	Interviews	\N	2017-03-14
313	greatandhra	టాగ్ లేకుండా వుండాలన్నదే నా ప్రయత్నం	http://telugu.greatandhra.com/movies/interviews/tag-lekunda-undalannde-na-prayatnam-64964.html	\N	Interviews	\N	2017-03-14
314	greatandhra	ప్రేక్షకుడి ఊహకు అందని సినిమాలు తీయాలి	http://telugu.greatandhra.com/movies/interviews/preshakudi-voohaku-andani-cinemalu-teeyali-64950.html	\N	Interviews	\N	2017-03-14
315	greatandhra	ప్రేక్షకుల్లో వస్తున్న మార్పు ఆనందం కలిగిస్తోంది	http://telugu.greatandhra.com/movies/interviews/preshakullo-vache-marpu-anandam-kaligisthondi-64594.html	\N	Interviews	\N	2017-03-14
316	greatandhra	తిరిగివ్వడాన్ని మించింది చెప్పాం : 'గ్రేటాంధ్ర'తో మహేష్‌	http://telugu.greatandhra.com/movies/interviews/we-said-beyond-giving-says-mahesh-with-ga-64075.html	\N	Interviews	\N	2017-03-14
317	greatandhra	మహేష్‌ పర్‌ఫార్మెన్స్‌ ఫీస్ట్‌లా వుంటుంది	http://telugu.greatandhra.com/movies/interviews/mahesh-performance-feast-la-vuntundi-64036.html	\N	Interviews	\N	2017-03-14
318	samayam	కారు కొనాలనే కోరిక ఎలా తీరిందో..	/social/teen-walks-5-hours-to-and-from-work-every-day-for-his-desire-for-car/articleshow/57634750.cms	\N	topnews	\N	2017-03-14
319	samayam	జయసుధ భర్త అనుమానాస్పద మృతి!	/telugu-movies/cinema-news/jayasudha-husband-nitin-kapoor-passes-away/articleshow/57633589.cms	\N	topnews	\N	2017-03-14
320	samayam	ధోనీ అంటే క్లార్క్‌కు ‘ఎం’త ఇష్టమంటే!	/sports-news/cricket/michael-clarke-meets-with-ms-dhoni-in-delhi/articleshow/57633940.cms	\N	topnews	\N	2017-03-14
321	samayam	మణిపూర్ సీఎంగా రేపు బిరెన్ ప్రమాణం	/latest-news/state-news/manipur-governor-invites-bjp-to-form-government-oath-ceremony-tomorrow/articleshow/57633286.cms	\N	topnews	\N	2017-03-14
322	samayam	ఎవరి దగ్గరెంతమంది? రసవత్తరంగా ‘కడప’ రాజకీయం!	/latest-news/state-news/kadapa-mlc-election-turns-interesting/articleshow/57633180.cms	\N	topnews	\N	2017-03-14
323	samayam	క్రికెట్, రాజకీయాలపై హీరోయిన్ హాట్ కామెంట్స్!	/telugu-movies/cinema-news/sayamikher-tweeting-on-current-issues/articleshow/57633832.cms	\N	topnews	\N	2017-03-14
324	samayam	ఆదాయం పెరుగుదలలో నం.1: కేసీఆర్	/latest-news/state-news/telangana-no-1-state-in-grouth-says-kcr/articleshow/57631923.cms	\N	topnews	\N	2017-03-14
325	samayam	జియో మరో సంచలనం.. ఈసారి గూగుల్‌తో కలిసి?	/latest-news/science-technology/reliance-jio-google-jointly-working-on-low-cost-4g-volte-android-phone/articleshow/57633339.cms	\N	topnews	\N	2017-03-14
326	samayam	బ్రోతల్ ఓనర్‌గా విద్యాబాలన్ విశ్వరూపం!	/telugu-movies/cinema-news/begum-jaan-trailer-vidya-balan-will-stun-you-as-the-fiery-and-fearless-brothel-owner/articleshow/57632595.cms	\N	topnews	\N	2017-03-14
327	samayam	గోవా సీఎంగా మనోహర్ పారికర్ ప్రమాణం	/latest-news/india-news/manohar-parrikar-takes-oath-as-goa-chief-minister/articleshow/57631867.cms	\N	topnews	\N	2017-03-14
328	samayam	రామ్‌చరణ్ సినిమాలో అరవింద్ స్వామి	/telugu-movies/cinema-news/arvind-swami-to-play-a-pivotal-role-in-ramcharan-maniratnam-film/articleshow/57630125.cms	\N	topnews	\N	2017-03-14
329	samayam	జనసేనలోకి చిరంజీవి?: పవన్ స్పందన	/latest-news/state-news/pawan-kalyan-comments-on-chiranjeevi-etry-in-to-janasena-party/articleshow/57631462.cms	\N	topnews	\N	2017-03-14
330	samayam	నెల రోజుల్లో పెళ్లి.. కలయిక అంటే భయం!	/lifestyle-news/relationships/i-am-scared-of-sex/articleshow/57633097.cms	\N	topnews	\N	2017-03-14
331	samayam		/telugu-movies/cinema-news/pawan-kalyans-katamarayudu-teaser-creates-new-record-in-tollywood/articleshow/57621185.cms	\N	telugu-movies	\N	2017-03-14
332	samayam		/telugu-movies/cinema-news/lost-many-chances-because-of-my-dark/articleshow/57624220.cms	\N	telugu-movies	\N	2017-03-14
333	samayam		/telugu-movies/cinema-news/sayamikher-tweeting-on-current-issues/articleshow/57633832.cms	\N	telugu-movies	\N	2017-03-14
334	samayam		/telugu-movies/cinema-news/avasarala-srinivas-babu-baga-busy-to-release-on-april-13/articleshow/57621875.cms	\N	telugu-movies	\N	2017-03-14
335	samayam	జయసుధ భర్త అనుమానాస్పద మృతి!	/telugu-movies/cinema-news/jayasudha-husband-nitin-kapoor-passes-away/articleshow/57633589.cms	\N	telugu-movies	\N	2017-03-14
336	samayam	దర్శకులు నన్ను అలానే చూస్తున్నారు: నటి	/telugu-movies/cinema-news/lost-many-chances-because-of-my-dark/articleshow/57624220.cms	\N	telugu-movies	\N	2017-03-14
337	samayam		/telugu-movies/cinema-news/jayasudha-husband-nitin-kapoor-passes-away/articleshow/57633589.cms	\N	telugu-movies	\N	2017-03-14
338	samayam		/telugu-movies/cinema-news/shankar-rajinikanth-film-2-0-satellite-rights-sold-for-rs-110-crore-to-zee/articleshow/57618613.cms	\N	telugu-movies	\N	2017-03-14
339	samayam		/telugu-movies/cinema-news/arvind-swami-to-play-a-pivotal-role-in-ramcharan-maniratnam-film/articleshow/57630125.cms	\N	telugu-movies	\N	2017-03-14
340	samayam		/telugu-movies/cinema-news/aamir-khan-offered-his-views-about-nepotism-in-bollywood/articleshow/57629076.cms	\N	telugu-movies	\N	2017-03-14
341	samayam		/telugu-movies/cinema-news/mom-first-look/articleshow/57627964.cms	\N	telugu-movies	\N	2017-03-14
342	samayam	శ్రీదేవి ‘మామ్’ ఫస్ట్‌లుక్.. అంతులేని ప్రశ్నలు	/telugu-movies/cinema-news/mom-first-look/articleshow/57627964.cms	\N	telugu-movies	\N	2017-03-14
343	samayam	క్రికెట్, రాజకీయాలపై హీరోయిన్ హాట్ కామెంట్స్!	/telugu-movies/cinema-news/sayamikher-tweeting-on-current-issues/articleshow/57633832.cms	\N	telugu-movies	\N	2017-03-14
344	samayam	యాంకర్ శ్రీముఖితో ‘బాబు బా...గా బిజీ’	/telugu-movies/cinema-news/avasarala-srinivas-babu-baga-busy-to-release-on-april-13/articleshow/57621875.cms	\N	telugu-movies	\N	2017-03-14
345	samayam	బ్రోతల్ ఓనర్‌గా విద్యాబాలన్ విశ్వరూపం!	/telugu-movies/cinema-news/begum-jaan-trailer-vidya-balan-will-stun-you-as-the-fiery-and-fearless-brothel-owner/articleshow/57632595.cms	\N	telugu-movies	\N	2017-03-14
346	samayam	రికార్డు ధరకి 2.0 శాటిలైట్ హక్కులు!	/telugu-movies/cinema-news/shankar-rajinikanth-film-2-0-satellite-rights-sold-for-rs-110-crore-to-zee/articleshow/57618613.cms	\N	telugu-movies	\N	2017-03-14
347	samayam	రామ్‌చరణ్-మణిరత్నం సినిమాలో అరవింద్ స్వామి	/telugu-movies/cinema-news/arvind-swami-to-play-a-pivotal-role-in-ramcharan-maniratnam-film/articleshow/57630125.cms	\N	telugu-movies	\N	2017-03-14
348	samayam	కరణ్-కంగనాల వివాదంపై అమీర్ ఖాన్ స్పందనేంటి ?	/telugu-movies/cinema-news/aamir-khan-offered-his-views-about-nepotism-in-bollywood/articleshow/57629076.cms	\N	telugu-movies	\N	2017-03-14
349	samayam	ఆల్ టైం రికార్డ్: కోటి కొట్టిన కాటమరాయుడు	/telugu-movies/cinema-news/pawan-kalyans-katamarayudu-teaser-creates-new-record-in-tollywood/articleshow/57621185.cms	\N	telugu-movies	\N	2017-03-14
350	samayam		/telugu-movies/cinema-news/begum-jaan-trailer-vidya-balan-will-stun-you-as-the-fiery-and-fearless-brothel-owner/articleshow/57632595.cms	\N	telugu-movies	\N	2017-03-14
351	samayam	​ వివాహితపై గ్యాంగ్ రేప్.. పిలిస్తేనే వచ్చింది	/social/28-year-old-mother-of-two-gang-raped-by-5-men/articleshow/57614142.cms	\N	social	\N	2017-03-14
352	samayam	కింగ్ కోబ్రా.. అయితే మాకేంటి!	/social/five-smart-dogs-use-tactics-to-beat-a-king-cobra/articleshow/57631292.cms	\N	social	\N	2017-03-14
353	samayam		/social/28-year-old-mother-of-two-gang-raped-by-5-men/articleshow/57614142.cms	\N	social	\N	2017-03-14
354	samayam		/social/karnataka-doctors-card-swiped-for-rs-4-lakh-instead-of-rs-40-at-toll-booth/articleshow/57626591.cms	\N	social	\N	2017-03-14
355	samayam		/social/rtc-to-pay-senior-citizen-rs-10000-for-not-providing-bus-seat/articleshow/57616934.cms	\N	social	\N	2017-03-14
356	samayam		/social/railway-responds-to-a-tweet-about-babys-milk-feed/articleshow/57628563.cms	\N	social	\N	2017-03-14
357	samayam		/social/two-girls-eloped-from-home-and-have-got-married-in-bengaluru/articleshow/57612857.cms	\N	social	\N	2017-03-14
358	samayam		/social/brazil-president-michel-temer-leaves-residence-due-to-ghosts/articleshow/57627672.cms	\N	social	\N	2017-03-14
359	samayam		/social/man-travels-hours-every-day-to-bring-water-to-thirsty-animals/articleshow/57603483.cms	\N	social	\N	2017-03-14
360	samayam		/social/beggar-helps-woman-deliver-baby-girl-at-busy-junction/articleshow/57617113.cms	\N	social	\N	2017-03-14
361	samayam	రూ. 40కి బదులు రూ. 4 లక్షలు గీకేశారు!	/social/karnataka-doctors-card-swiped-for-rs-4-lakh-instead-of-rs-40-at-toll-booth/articleshow/57626591.cms	\N	social	\N	2017-03-14
362	samayam	సీటు ఇవ్వలేకపోయినందుకు ఆర్టీసీపై జరిమానా!	/social/rtc-to-pay-senior-citizen-rs-10000-for-not-providing-bus-seat/articleshow/57616934.cms	\N	social	\N	2017-03-14
363	samayam	ఆ పేదరాలిది ఎంత పెద్ద హృదయమో..!	/social/beggar-helps-woman-deliver-baby-girl-at-busy-junction/articleshow/57617113.cms	\N	social	\N	2017-03-14
364	samayam		/social/five-smart-dogs-use-tactics-to-beat-a-king-cobra/articleshow/57631292.cms	\N	social	\N	2017-03-14
365	samayam	పారిపోయి పెళ్లి చేసుకున్న యువతులు	/social/two-girls-eloped-from-home-and-have-got-married-in-bengaluru/articleshow/57612857.cms	\N	social	\N	2017-03-14
366	samayam	దయ్యం భయంతో అధ్యక్ష భవనం వదిలి..	/social/brazil-president-michel-temer-leaves-residence-due-to-ghosts/articleshow/57627672.cms	\N	social	\N	2017-03-14
367	samayam	వన్య ప్రాణుల దాహార్తి తీర్చడానికి.. ఓ మనిషి పడుతున్న తపన	/social/man-travels-hours-every-day-to-bring-water-to-thirsty-animals/articleshow/57603483.cms	\N	social	\N	2017-03-14
368	samayam	హ్యాట్సాఫ్ రైల్వే: పసికందు ఆకలి తీర్చేందుకు ఆగిన రైలు	/social/railway-responds-to-a-tweet-about-babys-milk-feed/articleshow/57628563.cms	\N	social	\N	2017-03-14
369	samayam		/social/doctor-attempts-to-rape-patient/articleshow/57612581.cms	\N	social	\N	2017-03-14
370	samayam	ఆసుపత్రిలోనే డాక్టర్ అత్యాచారయత్నం	/social/doctor-attempts-to-rape-patient/articleshow/57612581.cms	\N	social	\N	2017-03-14
371	samayam		/latest-news/science-technology/reliance-jio-google-jointly-working-on-low-cost-4g-volte-android-phone/articleshow/57633339.cms	\N	latest-news	\N	2017-03-14
372	samayam	ఇది తెలిస్తే.. సైనికులకు జై కొట్టకుండా ఉండలేరు!	/latest-news/india-news/amazing-facts-about-the-indian-army-that-will-make-you-proud/articleshow/57630282.cms	\N	latest-news	\N	2017-03-14
373	samayam	మణిపూర్ సీఎంగా రేపు బిరెన్ ప్రమాణస్వీకారం	/latest-news/state-news/manipur-governor-invites-bjp-to-form-government-oath-ceremony-tomorrow/articleshow/57633286.cms	\N	latest-news	\N	2017-03-14
374	samayam	​మోడీతో పవన్ కల్యాణ్ కు సంబంధం లేనట్టే!	/latest-news/state-news/pavan-maintaining-distance-from-nda/articleshow/57631981.cms	\N	latest-news	\N	2017-03-14
375	samayam	బ్యాంకును బురిడీ కొట్టిద్దామని.. బొక్కబోర్లా పడ్డాడు!	/latest-news/state-news/fake-notes-worth-rs-9-90-lakh-surface-in-hyderabad-bank-man-held/articleshow/57630090.cms	\N	latest-news	\N	2017-03-14
376	samayam	జియో మరో సంచలనం.. ఈసారి గూగుల్‌తో కలిసి?	/latest-news/science-technology/reliance-jio-google-jointly-working-on-low-cost-4g-volte-android-phone/articleshow/57633339.cms	\N	latest-news	\N	2017-03-14
377	samayam		/latest-news/state-news/pavan-maintaining-distance-from-nda/articleshow/57631981.cms	\N	latest-news	\N	2017-03-14
378	samayam		/latest-news/state-news/pawan-kalyan-comments-on-chiranjeevi-etry-in-to-janasena-party/articleshow/57631462.cms	\N	latest-news	\N	2017-03-14
379	samayam		/latest-news/state-news/pawan-kalyan-press-meet-on-janasena-partys-third-anniversary/articleshow/57630841.cms	\N	latest-news	\N	2017-03-14
380	samayam		/latest-news/state-news/fake-notes-worth-rs-9-90-lakh-surface-in-hyderabad-bank-man-held/articleshow/57630090.cms	\N	latest-news	\N	2017-03-14
381	samayam	తెలంగాణ, ఏపీలో సమరం.. 60% సీట్లు వారికే: పవన్	/latest-news/state-news/pawan-kalyan-press-meet-on-janasena-partys-third-anniversary/articleshow/57630841.cms	\N	latest-news	\N	2017-03-14
382	samayam	ఎవరి దగ్గరెంతమంది? రసవత్తరంగా ‘కడప’రాజకీయం!	/latest-news/state-news/kadapa-mlc-election-turns-interesting/articleshow/57633180.cms	\N	latest-news	\N	2017-03-14
384	samayam	గోవా సీఎంగా మనోహర్ పారికర్ ప్రమాణం	/latest-news/india-news/manohar-parrikar-takes-oath-as-goa-chief-minister/articleshow/57631867.cms	\N	latest-news	\N	2017-03-14
385	samayam		/latest-news/india-news/manohar-parrikar-takes-oath-as-goa-chief-minister/articleshow/57631867.cms	\N	latest-news	\N	2017-03-14
386	samayam	చిరంజీవి జనసేన పార్టీలోకి రారు : పవన్	/latest-news/state-news/pawan-kalyan-comments-on-chiranjeevi-etry-in-to-janasena-party/articleshow/57631462.cms	\N	latest-news	\N	2017-03-14
387	samayam		/latest-news/state-news/telangana-no-1-state-in-grouth-says-kcr/articleshow/57631923.cms	\N	latest-news	\N	2017-03-14
388	samayam		/latest-news/india-news/amazing-facts-about-the-indian-army-that-will-make-you-proud/articleshow/57630282.cms	\N	latest-news	\N	2017-03-14
389	samayam	ఆదాయం పెరుగుదలలో మనమే నంబర్ 1: కేసీఆర్	/latest-news/state-news/telangana-no-1-state-in-grouth-says-kcr/articleshow/57631923.cms	\N	latest-news	\N	2017-03-14
390	samayam		/latest-news/state-news/kadapa-mlc-election-turns-interesting/articleshow/57633180.cms	\N	latest-news	\N	2017-03-14
391	samayam	ధోనీ అంటే క్లార్క్‌కు ‘ఎం’త ఇష్టమంటే!	/sports-news/cricket/michael-clarke-meets-with-ms-dhoni-in-delhi/articleshow/57633940.cms	\N	sports-news	\N	2017-03-14
392	samayam		/sports-news/cricket/ms-dhonis-sole-focus-is-on-icc-champions-trophy-2017/articleshow/57625361.cms	\N	sports-news	\N	2017-03-14
393	samayam		/sports-news/cricket/shivnarine-chanderpaul-son-hit-fifties-in-same-first-class-tie/articleshow/57623712.cms	\N	sports-news	\N	2017-03-14
394	samayam		/sports-news/cricket/hazel-keech-leaves-party-due-to-yuvraj-singhs-ex-girlfriend/articleshow/57614522.cms	\N	sports-news	\N	2017-03-14
395	samayam		/sports-news/cricket/virat-kohli-is-frustrated-as-he-has-hasnt-scored-runs/articleshow/57612739.cms	\N	sports-news	\N	2017-03-14
396	samayam	భారత క్రికెటర్‌ను ఏడిపించిన.. ఈడెన్ చరిత్ర	/sports-news/cricket/kambli-cries-as-india-crash-out/articleshow/57615142.cms	\N	sports-news	\N	2017-03-14
397	samayam		/sports-news/cricket/harsha-bhogle-may-return-to-host-ipl-matches/articleshow/57629107.cms	\N	sports-news	\N	2017-03-14
398	samayam	ధోనీ తలరాతను ఆ టోర్నీ డిసైడ్ చేస్తుంది..!	/sports-news/cricket/ms-dhonis-sole-focus-is-on-icc-champions-trophy-2017/articleshow/57625361.cms	\N	sports-news	\N	2017-03-14
399	samayam	వారెవ్వా లక్కీ.. క్రికెట్‌లో అరుదైన జోడి	/sports-news/cricket/shivnarine-chanderpaul-son-hit-fifties-in-same-first-class-tie/articleshow/57623712.cms	\N	sports-news	\N	2017-03-14
400	samayam	మన అశ్విన్ మళ్లీ నెం.1 అయ్యాడోచ్..!	/sports-news/cricket/ashwin-reclaims-no-1-test-ranking-for-all-rounders/articleshow/57616374.cms	\N	sports-news	\N	2017-03-14
401	samayam		/sports-news/cricket/ashwin-reclaims-no-1-test-ranking-for-all-rounders/articleshow/57616374.cms	\N	sports-news	\N	2017-03-14
402	samayam	కిమ్‌శర్మ రాకతో.. యువీని ఈడ్చుకొచ్చేసింది	/sports-news/cricket/hazel-keech-leaves-party-due-to-yuvraj-singhs-ex-girlfriend/articleshow/57614522.cms	\N	sports-news	\N	2017-03-14
403	samayam		/sports-news/cricket/kambli-cries-as-india-crash-out/articleshow/57615142.cms	\N	sports-news	\N	2017-03-14
404	samayam	కోచ్‌గా కుంబ్లేకు ఇదే చివరి సిరీస్?	/sports-news/cricket/anil-kumble-to-become-team-director-rahul-dravid-to-become-coach-report/articleshow/57606575.cms	\N	sports-news	\N	2017-03-14
405	samayam		/sports-news/cricket/michael-clarke-meets-with-ms-dhoni-in-delhi/articleshow/57633940.cms	\N	sports-news	\N	2017-03-14
406	samayam	కోహ్లి పని అయిపోయింది.. రెచ్చగొట్టిన జాన్సన్	/sports-news/cricket/virat-kohli-is-frustrated-as-he-has-hasnt-scored-runs/articleshow/57612739.cms	\N	sports-news	\N	2017-03-14
407	samayam	క్రికెట్ ప్రపంచంలోకి మళ్లీ ఆ గొంతు..?	/sports-news/cricket/harsha-bhogle-may-return-to-host-ipl-matches/articleshow/57629107.cms	\N	sports-news	\N	2017-03-14
408	samayam		/sports-news/cricket/vvs-laxman-dravid-transform-eden-gardens-into-cricketing-heaven/articleshow/57626446.cms	\N	sports-news	\N	2017-03-14
409	samayam		/sports-news/cricket/anil-kumble-to-become-team-director-rahul-dravid-to-become-coach-report/articleshow/57606575.cms	\N	sports-news	\N	2017-03-14
410	samayam	​ ఆసీస్ తొడగొడితే.. మన లక్ష్మణ్ పడగొట్టాడు..!	/sports-news/cricket/vvs-laxman-dravid-transform-eden-gardens-into-cricketing-heaven/articleshow/57626446.cms	\N	sports-news	\N	2017-03-14
411	samayam	కొత్త రూ.10 నోట్లు త్వరలో చెలామణిలోకి...!	/business/business-news/reserve-bank-of-india-to-issue-new-rs-10-notes/articleshow/57567491.cms	\N	business	\N	2017-03-14
412	samayam		/business/business-news/high-court-allows-intex-to-sell-aqua-brand-mobile-phones/articleshow/57618493.cms	\N	business	\N	2017-03-14
413	samayam	క్రికెట్‌పై ప్రేమ ఒలకబోస్తున్న చైనా బ్రాండ్లు!	/business/business-news/chinese-smartphone-brands-too-love-cricket/articleshow/57556025.cms	\N	business	\N	2017-03-14
414	samayam		/business/business-news/-nbfc-cash-loan-against-gold-restricted-to-rs-25000-rbi/articleshow/57561883.cms	\N	business	\N	2017-03-14
415	samayam		/business/business-news/airtel-to-offer-up-to-30gb-free-4g-data-to-postpaid-users/articleshow/57616977.cms	\N	business	\N	2017-03-14
416	samayam		/business/business-news/bsnl-announces-holi-offer-to-give-7gb-data/articleshow/57617721.cms	\N	business	\N	2017-03-14
417	samayam		/business/business-news/reliance-jio-working-with-google-to-launch-affordable-4g-phone-report/articleshow/57629502.cms	\N	business	\N	2017-03-14
418	samayam	బంగారు రుణాలపై ఆర్బీఐ మరో సంచలన ప్రకటన!	/business/business-news/-nbfc-cash-loan-against-gold-restricted-to-rs-25000-rbi/articleshow/57561883.cms	\N	business	\N	2017-03-14
419	samayam	ఆ ఫోన్లు అమ్ముకోవచ్చు: ఢిల్లీ హైకోర్టు	/business/business-news/high-court-allows-intex-to-sell-aqua-brand-mobile-phones/articleshow/57618493.cms	\N	business	\N	2017-03-14
420	samayam	బీఎస్ఎన్‌ఎల్ బంపర్ ఆఫర్లు!	/business/business-news/bsnl-announces-holi-offer-to-give-7gb-data/articleshow/57617721.cms	\N	business	\N	2017-03-14
421	samayam	క్రెడిట్ కార్డు ఫీజుపై వెనక్కి తగ్గిన పేటీఎం	/business/business-news/paytm-makes-a-u-turn-on-credit-card-fee/articleshow/57570669.cms	\N	business	\N	2017-03-14
422	samayam		/business/business-news/reliance-jio-effect-reliance-communications-offers-1gb-4g-data-for-rs-49/articleshow/57575684.cms	\N	business	\N	2017-03-14
423	samayam		/business/business-news/paytm-makes-a-u-turn-on-credit-card-fee/articleshow/57570669.cms	\N	business	\N	2017-03-14
424	samayam		/business/business-news/reserve-bank-of-india-to-issue-new-rs-10-notes/articleshow/57567491.cms	\N	business	\N	2017-03-14
425	samayam	తక్కువ ధరకే జియో-గూగుల్ 4జీ ఫోన్!	/business/business-news/reliance-jio-working-with-google-to-launch-affordable-4g-phone-report/articleshow/57629502.cms	\N	business	\N	2017-03-14
426	samayam		/business/business-news/chinese-smartphone-brands-too-love-cricket/articleshow/57556025.cms	\N	business	\N	2017-03-14
427	samayam	ఎయిర్‌టెల్ ఉచిత 30జీబీ 4జీ డాటా ఆఫర్!	/business/business-news/airtel-to-offer-up-to-30gb-free-4g-data-to-postpaid-users/articleshow/57616977.cms	\N	business	\N	2017-03-14
428	samayam	రెండు నెలల కనిష్ఠానికి బంగారం ధర!	/business/business-news/todays-gold-prices-in-bullian-market/articleshow/57579742.cms	\N	business	\N	2017-03-14
429	samayam	రూ. 49కే రిలయన్స్ 1జీబీ 4జీ డాటా!	/business/business-news/reliance-jio-effect-reliance-communications-offers-1gb-4g-data-for-rs-49/articleshow/57575684.cms	\N	business	\N	2017-03-14
430	samayam		/business/business-news/todays-gold-prices-in-bullian-market/articleshow/57579742.cms	\N	business	\N	2017-03-14
431	oneindia	జగన్ కు చెక్: వెంకయ్యకు బాబు ఫోన్, రైల్వేజోన్ పై త్వరలోనే ప్రకటన?	http://telugu.oneindia.com/news/andhra-pradesh/chandrababu-naidu-welcomed-union-cabinet-approval-on-specia-197301.html	http://telugu.oneindia.com/img/2017/03/22-chandra-babu-modi-15-1489597917.jpg	\N	\N	2017-03-15
432	oneindia	అమెరికాలో మంచు తుఫాను బీభత్సం: వాషింగ్టన్‌లో విద్యుత్ నిలిపివేత	http://telugu.oneindia.com/news/international/snowstorm-strikes-north-eastern-united-states-197298.html	http://telugu.oneindia.com/img/2017/03/30-polar-freeze-604-15-1489587672.jpg	\N	\N	2017-03-15
433	oneindia	జియోకు షాక్: 6 నెలలపాటు ఐడియా ఉచిత డేటా	http://telugu.oneindia.com/news/india/itel-idea-cellular-tie-up-offer-6-gb-free-data-on-various-s-197300.html	http://telugu.oneindia.com/img/2017/03/idea-01-1472721686-15-1489592927.jpg	\N	\N	2017-03-15
434	oneindia	ఏపీకి శుభవార్త, ప్యాకేజీకి మోడీ కేబినెట్ ఓకే: పవన్-జగన్‌లకు చెక్!	http://telugu.oneindia.com/news/andhra-pradesh/modi-government-ready-give-legal-sanctity-sp-special-package-cabinet-green-signal-197299.html	http://telugu.oneindia.com/img/2017/03/pawan-kalyan-modi-cbn-666-15-1489589180.jpg	\N	\N	2017-03-15
435	oneindia	ఆటో డ్రైవర్ విధ్యార్థినిపై అత్యాచారయత్నం, ఆటోలో నుండి దూకి  ఇలా....	http://telugu.oneindia.com/news/andhra-pradesh/seventh-class-girl-rape-attempt-auto-driver-197297.html	http://telugu.oneindia.com/img/2017/03/rape-678-15-1489586151.jpg	\N	\N	2017-03-15
436	oneindia	ఆక్సిజన్‌కు రూ.150 లంచం.. వ్యక్తి మృతి: ఫ్యామిలికీ రేవంత్ రెడ్డి సాయం	http://telugu.oneindia.com/news/telangana/painful-apathy-at-hyderabad-s-government-hospital-leaves-one-patient-dead-197296.html	http://telugu.oneindia.com/img/2017/03/revanth-reddy-697-15-1489586006.jpg	\N	\N	2017-03-15
437	oneindia	వైరల్ అవుతున్న మోడీ ట్వీట్, ఫ్రాన్స్ అధ్యక్షుడి అభినందన	http://telugu.oneindia.com/news/india/pm-modi-s-reply-twitter-user-who-claimed-pm-works-him-is-absolutely-witty-197295.html	http://telugu.oneindia.com/img/2017/03/narendra-modi-bjp-651-15-1489585278.jpg	\N	\N	2017-03-15
438	oneindia	మార్కెట్లోకి కొత్త ఫోన్, జీ 5 ప్లస్  పేరుతో మోటో కొత్త ఫోన్ ,అదిరిపోయే ఫీచర్లు	http://telugu.oneindia.com/news/india/moto-g5-plus-with-snapdragon-625-launch-india-rs-14-999-march-197294.html	http://telugu.oneindia.com/img/2017/03/moto-g5-666-15-1489585002.jpg	\N	\N	2017-03-15
439	oneindia	లోకసభలో మోడీకి 'జై శ్రీరాం'తో స్వాగతం, బిజూ జనతాదళ్ ఎంపీ కూడా..	http://telugu.oneindia.com/news/india/when-jai-shri-ram-slogans-greeted-pm-narendra-modi-lok-sabha-197292.html	http://telugu.oneindia.com/img/2017/03/narendra-modi-639-15-1489584029.jpg	\N	\N	2017-03-15
440	oneindia	డీఆర్ఎస్: కోహ్లీవి అసంబద్ధ వ్యాఖ్యలన్న స్టీవ్ స్మిత్	http://telugu.oneindia.com/news/sports/cricket/india-vs-australia-steve-smith-terms-virat-kohli-s-claims-on-drs-row-as-complete-rubbish-197291.html	http://telugu.oneindia.com/img/2017/03/steve-smith-teases-ishant-68-15-1489583569.jpg	\N	\N	2017-03-15
441	oneindia	'ంటరి మహిళలే టార్గెట్, పోలీసు అవతారమెత్తిన పాత నేరస్తుడు, చివరికిలా...	http://telugu.oneindia.com/news/telangana/madhapur-police-arrested-fake-police-hyderabad-197290.html	http://telugu.oneindia.com/img/2017/03/robbery-695-15-1489583412.jpg	\N	\N	2017-03-15
442	oneindia	చంద్రబాబూ! ఈ లెక్క ప్రకారం ఆల్ రెడీ నెం.1, టార్గెట్ 2029 ఎందుకు: జగన్	http://telugu.oneindia.com/news/andhra-pradesh/ys-jagan-says-according-chandrababu-ap-is-no-one-197289.html	http://telugu.oneindia.com/img/2017/03/ys-jagan-cbn-666-15-1489582437.jpg	\N	\N	2017-03-15
443	oneindia	న్యూయార్క్ సంస్థ-క్వాలిటీ ఆఫ్ లివింగ్‌లో హైదరాబాద్ ఫస్ట్: కేసీఆర్ ప్రశంస	http://telugu.oneindia.com/news/telangana/hyderabad-again-ranks-top-quality-living-kcr-happy-197288.html	http://telugu.oneindia.com/img/2017/03/hyderabad-666-15-1489581398.jpg	\N	\N	2017-03-15
444	oneindia	నా మనసులో కోహ్లీకి ప్రత్యేక స్థానం: మైకేల్ క్లార్క్	http://telugu.oneindia.com/news/sports/cricket/michael-clarke-donates-his-world-cup-winning-jersey-at-the-launch-of-his-autobiography-197287.html	http://telugu.oneindia.com/img/2017/03/michael-clarke-sourav-ganguly-698-15-1489580815.jpg	\N	\N	2017-03-15
445	oneindia	ముందస్తు ఎన్నికలకు వెళ్లే ప్రసక్తే లేదు, ఆ కేసు విత్ డ్రా చేసుకోండి: కేసీఆర్	http://telugu.oneindia.com/news/telangana/no-thought-on-early-polls-telangana-says-cm-kcr-197286.html	http://telugu.oneindia.com/img/2017/03/kcr-t-cm-658-15-1489580603.jpg	\N	\N	2017-03-15
446	oneindia	ఆర్ కె నగర్ ఉప ఎన్నికల్లో 50 వేల మెజారిటితో విజయం సాధిస్తా:దినకరన్	http://telugu.oneindia.com/news/india/i-will-win-rk-nagar-elections-dinkaran-197285.html	http://telugu.oneindia.com/img/2017/03/dinakaran-634-15-1489580468.jpg	\N	\N	2017-03-15
447	oneindia	వైయస్సార్ కాంగ్రెస్ పార్టీ ఎమ్మెల్యేల సంతకాలు, టిడిపి సీరియస్!	http://telugu.oneindia.com/news/andhra-pradesh/telugudesam-party-leaders-angry-at-ysrcp-mla-sigining-record-197284.html	http://telugu.oneindia.com/img/2017/03/ysrcp-645-15-1489580293.jpg	\N	\N	2017-03-15
448	oneindia	పన్నీర్ సెల్వం వర్గం మళ్లీ వెనకడుగు: ఆలస్యం చేస్తే అంతే ! 	http://telugu.oneindia.com/news/india/pannerselvam-team-will-announce-it-s-candidate-r-k-nagar-with-197283.html	http://telugu.oneindia.com/img/2017/03/images6-15-1489579389.jpg	\N	\N	2017-03-15
449	oneindia	నా గురించి చెత్తగా మాట్లాడొద్దని బ్యానర్‌ పెట్టుకొను: కోహ్లీ	http://telugu.oneindia.com/news/sports/cricket/india-vs-australia-virat-kohli-suggests-burying-the-hatchet-over-drs-row-197282.html	http://telugu.oneindia.com/img/2017/03/virat-kohli-657-15-1489578525.jpg	\N	\N	2017-03-15
450	oneindia	నరేంద్ర మోడీ ఎఫెక్ట్: జయలలితను ఫాలో అవుతున్న సిద్ధు	http://telugu.oneindia.com/news/india/siddaramaiah-follow-jayalalithaa-197281.html	http://telugu.oneindia.com/img/2017/03/modi-siddaramaiah-jaya-666-15-1489578021.jpg	\N	\N	2017-03-15
451	oneindia	స్కానింగ్: ఇకపై తిరుమలలో ఆ రూల్ తప్పనిసరి!..	http://telugu.oneindia.com/news/andhra-pradesh/ticket-scanning-rule-tirumala-197280.html	http://telugu.oneindia.com/img/2017/03/tirupati-brahmotsavam-latest-600-15-1489577946.jpg	\N	\N	2017-03-15
452	oneindia	మహిళల అక్రమ రవాణా రాకెట్ గుట్టురట్టు: 9మంది దళారుల అరెస్ట్	http://telugu.oneindia.com/news/telangana/women-trafficking-racket-busted-197279.html	http://telugu.oneindia.com/img/2017/03/prostitution-600-15-1489577632.jpg	\N	\N	2017-03-15
453	oneindia	కిరాకతం: మాయమాటలతో ప్రలోభపెట్టి అమ్మాయిలపై లైంగికదాడులు	http://telugu.oneindia.com/news/india/manjunath-arrested-sexual-harassment-karnataka-197278.html	http://telugu.oneindia.com/img/2017/03/arrest-695-15-1489577353.jpg	\N	\N	2017-03-15
454	oneindia	టెక్నికల్ ఆఫీసర్ పోస్టులు: ఎన్ఏఎల్ రిక్రూట్‌మెంట్-2017	http://telugu.oneindia.com/news/india/nal-recruitment-2017-apply-online-28-various-vacancies-197277.html	http://telugu.oneindia.com/img/2017/03/jobs-645-15-1489577031.jpg	\N	\N	2017-03-15
455	oneindia	15నిమిషాల్లో బ్రెడ్ ప్యాకెట్ ఎక్స్‌పైర్‌: ఆశ్చర్యపోయిన సెహ్వాగ్‌	http://telugu.oneindia.com/news/sports/cricket/sehwag-comment-on-his-friend-expire-bread-197276.html	http://telugu.oneindia.com/img/2017/03/virender-sehwag-697-15-1489576743.jpg	\N	\N	2017-03-15
456	oneindia	బీజేపీ మొహాల్లోనే ఆ విషయం కనిపిస్తోంది: మాయావతి	http://telugu.oneindia.com/news/india/mayawati-set-move-court-against-evm-tampering-up-elections-197275.html	http://telugu.oneindia.com/img/2017/03/mayawati-and-narendra-modi-666-15-1489576592.jpg	\N	\N	2017-03-15
457	oneindia	షాక్: ఉత్తర్ ప్రదేశ్ పిసిసి చీఫ్ పార్టీకి రాజీనామా, రాహుల్ పై విమర్శలు	http://telugu.oneindia.com/news/india/uttar-pradesh-pcc-chief-raj-babbar-resigned-congress-party-197274.html	http://telugu.oneindia.com/img/2017/03/raja-babbar-607-15-1489576469.jpg	\N	\N	2017-03-15
458	oneindia	బీచ్‌లో ఘోరం: రేప్? రక్తపు మడుగులో నగ్నంగా విదేశీ యువతి	http://telugu.oneindia.com/news/india/goa-irish-woman-found-dead-naked-after-holi-197273.html	http://telugu.oneindia.com/img/2017/03/holi-665-15-1489576097.jpg	\N	\N	2017-03-15
459	oneindia	'స్క్రిప్ట్ రాయించి మరీ భూమాపై టీడీపీ అలా!, ఆ యాక్టింగ్‌కు కమల్ కూడా పనికిరారు'	http://telugu.oneindia.com/news/andhra-pradesh/tdp-leaders-are-great-actors-than-kamal-haasan-prakash-raj-197272.html	http://telugu.oneindia.com/img/2017/03/chevireddy-bhaskar-reddy-607-15-1489576255.jpg	\N	\N	2017-03-15
460	oneindia	నేను పాటలు ఆపను: ఫత్వాపై ముస్లీం యువతి, సీఎం అండ	http://telugu.oneindia.com/news/india/will-never-quit-singing-says-assam-teen-after-fatwa-muslim-clerics-197271.html	http://telugu.oneindia.com/img/2017/03/nahid-afrin-607-15-1489575518.jpg	\N	\N	2017-03-15
461	oneindia	బీజేపీలోకి రమ్య?: వస్తే ఆత్మహత్యేనంటూ ఆ పార్టీ నేత సంచలనం!	http://telugu.oneindia.com/news/india/rumors-mandya-former-congress-mp-ramya-joining-bjp-197270.html	http://telugu.oneindia.com/img/2017/03/ramya-675-15-1489573210.jpg	\N	\N	2017-03-15
462	oneindia	ఐసీసీ ఛైర్మన్ పదవికి శశాంక్‌ రాజీనామా: ట్విట్టర్ బేజారు	http://telugu.oneindia.com/news/sports/cricket/shashank-manohar-steps-down-as-icc-chief-twitter-a-state-shock-197269.html	http://telugu.oneindia.com/img/2017/03/shashank-manohar-icc-chief-698-15-1489572847.jpg	\N	\N	2017-03-15
463	oneindia	'బాబు వస్తే జాబు వస్తుందనుకున్నాం.. లోకేష్‌కు ఎమ్మెల్సీ వస్తుందనుకోలేదు'	http://telugu.oneindia.com/news/andhra-pradesh/mla-roja-criticizes-chandrababu-naidu-over-ap-budget-197268.html	http://telugu.oneindia.com/img/2017/03/chandrababu-naidu-lokesh-697-15-1489572215.jpg	\N	\N	2017-03-15
464	oneindia	కడప:స్థానిక సంస్థల ఎమ్మెల్సీ ఎన్నికల్లో గెలుపు కోసం చంద్రబాబు, జగన్ పార్టీల ఎత్తులు	http://telugu.oneindia.com/news/andhra-pradesh/tdp-strategy-mlc-elections-kadapa-197267.html	http://telugu.oneindia.com/img/2017/03/jagan-cbn-666-04-1462362640-15-1489571840.jpg	\N	\N	2017-03-15
465	oneindia	నేను నిప్పులో దూకమంటే వాళ్లు దూకేవారు, మీరు మాత్రం!: చంద్రబాబు	http://telugu.oneindia.com/news/andhra-pradesh/chandrababu-talks-about-madhava-reddy-gmc-balayogi-tdlp-meeting-197266.html	http://telugu.oneindia.com/img/2017/03/chandrababu-naidu-653-15-1489571702.jpg	\N	\N	2017-03-15
466	oneindia	రాజకీయ రాక్షసత్వం: భోజనం చేస్తున్న యువకుడిపై కత్తులతో దాడి, కారుకు కట్టి ఈడ్చుకెళ్లారు	http://telugu.oneindia.com/news/india/haryana-man-dies-after-son-inld-leader-allegedly-attacked-him-197265.html	http://telugu.oneindia.com/img/2017/03/murder-15-1489573714.jpg	\N	\N	2017-03-15
467	oneindia	ఈరోజు ప్రత్యేకత ఇదే: తొలి టెస్టు జరిగి 140 సంవత్సరాలు 	http://telugu.oneindia.com/news/sports/cricket/google-celebrates-140th-anniversary-first-official-test-cricket-match-with-a-doodle-197264.html	http://telugu.oneindia.com/img/2017/03/3-day-night-test-15-1489570771.jpg	\N	\N	2017-03-15
468	oneindia	అది హత్యే!: కొడుకు మృతిపై ఎమ్మెల్యే బాలకృష్ణ గన్‌మెన్ ఆరోపణ	http://telugu.oneindia.com/news/andhra-pradesh/another-angle-narayana-student-suicide-case-197263.html	http://telugu.oneindia.com/img/2017/03/crime-scene-697-15-1489570433.jpg	\N	\N	2017-03-15
469	oneindia	వ్యక్తి ఖాతాలో రూ.17 కోట్లు: ఐటీ అధికారుల విచారణలో షాకింగ్ నిజాలు	http://telugu.oneindia.com/news/telangana/it-found-rs-17-crores-unknown-persons-account-197262.html	http://telugu.oneindia.com/img/2017/03/2000-notes-687-15-1489569691.jpg	\N	\N	2017-03-15
470	oneindia	మణిపూర్‌లో బీజేపీ తొలిసారి: సీఎంగా బీరేన్ ప్రమాణం, అందుకే అమిత్ షా గైర్హాజరు	http://telugu.oneindia.com/news/india/biren-singh-sworn-as-chief-minister-manipur-197261.html	http://telugu.oneindia.com/img/2017/03/biren-singh-607-15-1489568875.jpg	\N	\N	2017-03-15
471	oneindia	ఫీల్డ్‌లో కొట్టుకున్న ఆసీస్ క్రికెటర్లు: నెట్‌లో వీడియో వైరల్  	http://telugu.oneindia.com/news/sports/cricket/video-angry-batsman-pushes-bowler-after-getting-dismissed-197260.html	http://telugu.oneindia.com/img/2017/03/cricketers-clash-australia-695-15-1489568571.jpg	\N	\N	2017-03-15
472	oneindia	శుభవార్త: టెక్కీలకు ఉచిత ప్రయాణం, వసతిని కల్పించనున్న న్యూజిలాండ్, అమెరికాకు చెక్?	http://telugu.oneindia.com/news/international/new-zealand-looking-techies-free-flight-free-stay-job-interview-197259.html	http://telugu.oneindia.com/img/2017/03/techie-674-15-1489568234.jpg	\N	\N	2017-03-15
473	oneindia	చంద్రబాబును కలిసేందుకు వచ్చి!: అసెంబ్లీ ఎదుట యువతి 'ఆత్మహత్యాయత్నం'	http://telugu.oneindia.com/news/andhra-pradesh/woman-suicide-attempt-at-ap-assembly-velagapudi-197258.html	http://telugu.oneindia.com/img/2017/03/chandrababu-naidu-ap-cm-676-15-1489567852.jpg	\N	\N	2017-03-15
474	oneindia	దిగ్గీరాజా శల్య సారథ్యం: హస్తం పుట్టి మునిగింది.. కాంగ్రెస్‌కు గోవా నేతలు గుడ్ బై	http://telugu.oneindia.com/news/india/disquiet-goa-congress-over-digvijaya-singh-s-mismanagement-197257.html	http://telugu.oneindia.com/img/2017/03/digvijay-singh-15-1489567471.jpg	\N	\N	2017-03-15
475	oneindia	నో ఎంట్రీ: చిరంజీవికి నో చెప్పిన పవన్ కళ్యాణ్! పీఆర్పీ ఎపెక్ట్.. జనసేన జాగ్రత్త	http://telugu.oneindia.com/news/andhra-pradesh/chiranjeevi-will-not-join-hands-with-pawan-kalyan-197256.html	http://telugu.oneindia.com/img/2017/03/chiranjeevi-pawan-kalyan-691-15-1489564798.jpg	\N	\N	2017-03-15
476	oneindia	భూమా నాగిరెడ్డిలో మరో కోణం: అప్పుడు అదో సంచలనం, విభజనపై..	http://telugu.oneindia.com/news/andhra-pradesh/faction-peace-another-angle-bhuma-nagi-reddy-197255.html	http://telugu.oneindia.com/img/2017/03/bhuma-nagireddy-674-15-1489564446.jpg	\N	\N	2017-03-15
477	oneindia	అదిగో చార్మినార్.. ఇదిగో సేల్ పేపర్: చంద్రబాబుపై జగన్ సెటైర్లు	http://telugu.oneindia.com/news/andhra-pradesh/ys-jagan-satires-on-chandrababu-naidu-197254.html	http://telugu.oneindia.com/img/2017/03/ys-jagan-cbn-assembly-666-15-1489563992.jpg	\N	\N	2017-03-15
478	oneindia	ఐసీసీ ఛైర్మన్ పదవికి శశాంక్ మనోహార్ రాజీనామా	http://telugu.oneindia.com/news/sports/cricket/shashank-manohar-resigns-as-icc-chairman-197253.html	http://telugu.oneindia.com/img/2017/03/shashank-manohar-678-15-1489563527.jpg	\N	\N	2017-03-15
479	oneindia	మూడో టెస్టు: కోహ్లీసేన 'దూకుడు'పై కుంబ్లే ఇలా (ఫోటోలు)	http://telugu.oneindia.com/news/sports/cricket/3rd-test-anil-kumble-does-not-want-curb-natural-instincts-of-his-players-197252.html	http://telugu.oneindia.com/img/2017/03/anil-kumble-632-15-1489563314.jpg	\N	\N	2017-03-15
480	oneindia	అద్భుతం చేశారు, కానీ: మోడీకి పాక్ బాలిక లేఖ, ఏం చెప్పిందంటే..?	http://telugu.oneindia.com/news/india/pakistani-girl-congratulates-pm-modi-up-victory-calls-turning-197251.html	http://telugu.oneindia.com/img/2017/03/girl-15-1489563181.jpg	\N	\N	2017-03-15
481	oneindia	శశికళకు చెక్: ఢిల్లీలో పన్నీర్ సెల్వం, 61 పేజీల లేఖతో ! 	http://telugu.oneindia.com/news/india/the-appointment-v-k-sasikala-as-general-secretary-as-null-void-197250.html	http://telugu.oneindia.com/img/2017/03/pannerselvam-645-15-1489563024.jpg	\N	\N	2017-03-15
482	oneindia	భర్త, ప్రియుడు ఇద్దరూ కావాలి: 'ఫేస్‌బుక్ ప్రేమ'.. సందిగ్ధంలో వివాహిత	http://telugu.oneindia.com/news/andhra-pradesh/a-married-woman-letter-a-psychologist-about-her-facebook-love-197249.html	http://telugu.oneindia.com/img/2017/03/05-facebook-301-15-1489562652.jpg	\N	\N	2017-03-15
483	oneindia	అనంతపురంలో వింత: బోరు వేయకుండా ఊబికి వచ్చిన నీళ్లు!	http://telugu.oneindia.com/news/andhra-pradesh/ground-water-from-old-well-anantapur-197248.html	http://telugu.oneindia.com/img/2017/03/27-well-15-1489561730.jpg	\N	\N	2017-03-15
484	oneindia	ఇండియన్ వెల్స్: ముగిసిన భారత పోరు, సానియా జోడీ ఓటమి	http://telugu.oneindia.com/news/sports/indian-wells-last-indian-the-fray-sania-mirza-bows-in-quarter-final-with-barbora-197247.html	http://telugu.oneindia.com/img/2017/03/sania-mirza-lost-607-15-1489561310.jpg	\N	\N	2017-03-15
485	oneindia	కోహ్లీలాగా ఎదగాలని ఉంది: పాక్ బ్యాటింగ్ సెన్సేషన్ బాబర్	http://telugu.oneindia.com/news/sports/cricket/pakistan-batting-sensation-babar-azam-wants-emulate-virat-kohli-197246.html	http://telugu.oneindia.com/img/2017/03/xazhar-ali-test-century-vs-australia-14-1489492113-15-1489560780.jpg	\N	\N	2017-03-15
486	oneindia	నాలుగు దశాబ్దాల కాలంలో తగ్గిపోయిన హిందువుల జనాభా!	http://telugu.oneindia.com/feature/general/hindu-population-percentage-has-decreased-3-since-1971-197245.html	http://telugu.oneindia.com/img/2017/03/hindu-population-6665-15-1489560634.jpg	\N	\N	2017-03-15
487	oneindia	2014లో గ్రాడ్యుయేషన్, 2017లో ఇంటర్ చదివినట్లు చూపిన టీఆర్ఎస్ ఎమ్మెల్సీ	http://telugu.oneindia.com/news/telangana/trs-hyderabad-chief-qualifications-differ-197244.html	http://telugu.oneindia.com/img/2017/03/mynampally-hanumantha-rao-607-15-1489560240.jpg	\N	\N	2017-03-15
488	oneindia	కాక పుట్టిస్తోన్న ఆర్కేనగర్ 'బై ఎలక్షన్': గౌతమిని బరిలో దించనున్న బీజేపీ!	http://telugu.oneindia.com/news/india/actor-gautami-is-the-bjp-choice-candidate-r-k-nagar-election-197243.html	http://telugu.oneindia.com/img/2017/03/gautami-672-15-1489560166.jpg	\N	\N	2017-03-15
489	oneindia	ధనం కాపాడుకోవటమే లక్ష్మి స్థిరత్వం: వాటికి దూరంగా ఉంటే సంపద మీదగ్గరే!	http://telugu.oneindia.com/jyotishyam/feature/how-save-your-wealth-197242.html	http://telugu.oneindia.com/img/2017/03/lakshmi-1-15-1489559217.jpg	\N	\N	2017-03-15
490	oneindia	రేర్ ఫీట్: పాకిస్థాన్ దేశవాళీ క్రికెట్ టోర్నీలో సిక్కు క్రికెటర్‌	http://telugu.oneindia.com/news/sports/cricket/rare-feat-sikh-cricketer-mahinder-pal-singh-plays-pakistan-s-domestic-league-197241.html	http://telugu.oneindia.com/img/2017/03/pcb-logo-666-15-1489558235.jpg	\N	\N	2017-03-15
491	oneindia	'కోడిపుంజు' గుర్తు కోసం దీప ప్రయత్నాలు.. 'కప్పుడు జయలలిత గుర్తు అదే!	http://telugu.oneindia.com/news/india/jayalalithaa-s-niece-applied-election-commission-party-symbol-197240.html	http://telugu.oneindia.com/img/2017/03/deepa-jayakumar-691-15-1489557863.jpg	\N	\N	2017-03-15
492	oneindia	ఎదురుకాల్పులు: ఇద్దరు ఉగ్రవాదులు హతం, కొనసాగుతున్న వేట	http://telugu.oneindia.com/news/india/2-terrorists-killed-kupwara-j-k-encounter-197239.html	http://telugu.oneindia.com/img/2017/03/xjawan-15-1489549598-15-1489557093.jpg	\N	\N	2017-03-15
493	oneindia	నేనే అసలైన వారసున్ని: తెర పైకి జయలలిత కొడుకు!, 'అది నచ్చకే చంపేశారు'	http://telugu.oneindia.com/news/india/now-tamil-nadu-man-claims-he-is-jayalalithaa-s-real-son-197238.html	http://telugu.oneindia.com/img/2017/03/jaya-story-666-15-1489558133.jpg	\N	\N	2017-03-15
494	oneindia	'సర్దార్ జీ'కి మాత్రమే తెలుసు: మంకీగేట్ వివాదంపై గంగూలీ	http://telugu.oneindia.com/news/sports/cricket/only-sardar-ji-will-know-what-harbhajan-trying-say-sourav-ganguly-197237.html	http://telugu.oneindia.com/img/2017/03/3-sourav-ganguly-15-1489556690.jpg	\N	\N	2017-03-15
495	oneindia	లోకేష్‌ను ఏకేసిన నగ్మా: ఆస్తులపై ట్విట్టర్‌లో ఉతికేసింది!..	http://telugu.oneindia.com/news/india/congress-leader-nagma-tweets-on-chandrababu-naidus-son-lokesh-197236.html	http://telugu.oneindia.com/img/2017/03/28-congress-15-1489556629.jpg	\N	\N	2017-03-15
496	oneindia	సర్వే: దక్షిణాదిన బీజేపీ ప్రభుత్వం, కర్నాటకలో 150 సీట్లు	http://telugu.oneindia.com/talk-of-the-day/in-karnataka-bjp-will-win-129-150-seats-says-survey-197235.html	http://telugu.oneindia.com/img/2017/03/bjp-09-15-1489556034.jpg	\N	\N	2017-03-15
497	oneindia	విమానంలో పేలిన హెడ్‌ఫోన్స్: కాలిపోయిన యువతి మొహం	http://telugu.oneindia.com/news/international/headphones-explode-mid-flight-197234.html	http://telugu.oneindia.com/img/2017/03/woman-15-1489555467.jpg	\N	\N	2017-03-15
498	oneindia	పవన్ సంగారెడ్డి సభ వెనుక జగ్గారెడ్డి!: ఏ వ్యూహంతో జనసేన అడుగులు?..	http://telugu.oneindia.com/grapevine/2017/why-pawan-kalyan-choosed-sangareddy-public-meeting-197233.html	http://telugu.oneindia.com/img/2017/03/15-jana-sena-6-15-1489555075.jpg	\N	\N	2017-03-15
499	oneindia	బీజేపీ రాక: తల్లీకూతుళ్లపై గ్యాంగ్‌రేప్ నిందితుడు, మాజీ మంత్రి ప్రజాపతి అరెస్ట్ 	http://telugu.oneindia.com/news/india/rape-accused-up-leader-gayatri-prajapati-arrested-197232.html	http://telugu.oneindia.com/img/2017/03/gayatri-prajapati-695-15-1489559514.jpg	\N	\N	2017-03-15
500	oneindia	రాజధాని నుంచి మెట్రో దాకా..: కాపులకు 1000 కోట్లు, నిరుద్యోగులకు 500 కోట్లు	http://telugu.oneindia.com/news/andhra-pradesh/andhra-pradesh-budget-2017-live-yanamala-presents-budget-am-197231.html	http://telugu.oneindia.com/img/2017/03/yanamala-ramakrishnudu-pic-687-11-1484106832-15-1489554017.jpg	\N	\N	2017-03-15
501	oneindia	ఎన్టీఆర్ ఎప్పుడో చెప్పారు: మోడీ హవాపై కేటీఆర్ ఆసక్తికరం, రాహుల్ ఉన్నంత వరకు..	http://telugu.oneindia.com/news/telangana/ktr-interesting-comments-on-pm-modi-after-up-win-197230.html	http://telugu.oneindia.com/img/2017/03/11-1434013441-ktr-678678-15-1489551546.jpg	\N	\N	2017-03-15
502	oneindia	చిన్నమ్మకు ఝలక్: శశికళ 'ఫోటో' పెట్టడానికే బెంబేలెత్తుతున్నారు..	http://telugu.oneindia.com/news/india/there-is-no-photo-sasikala-party-banners-197229.html	http://telugu.oneindia.com/img/2017/03/sasikala-natarajan2-16-1484571420-15-1489551491.jpg	\N	\N	2017-03-15
503	oneindia	కామాంధుడు: సంబంధం పెట్టుకోవాలంటూ కోడలిపై చినమామ రేప్	http://telugu.oneindia.com/news/telangana/a-man-allegedly-raped-his-daughter-law-197228.html	http://telugu.oneindia.com/img/2017/03/21-rape-victim-15-1489550670.jpg	\N	\N	2017-03-15
504	oneindia	నేడే ఏపీ బడ్జెట్: మహిళలు, యువతకు పెద్దపీట, నిరుద్యోగ భృతి!	http://telugu.oneindia.com/news/andhra-pradesh/ap-budget-may-focus-on-fiscal-consolidation-as-deficits-mount-197227.html	http://telugu.oneindia.com/img/2017/03/09-yanamala-ramakrishnudu-600-15-1489548301.jpg	\N	\N	2017-03-15
505	oneindia	ఇక మీరు మారరా?: ఆ జిల్లా ఎమ్మెల్యేలకు క్లాస్ పీకిన చంద్రబాబు, హెచ్చరిక 	http://telugu.oneindia.com/news/andhra-pradesh/chandrababu-naidu-fires-at-anantapur-district-mlas-197226.html	http://telugu.oneindia.com/img/2017/03/chandrababu-15-1489545164.jpg	\N	\N	2017-03-15
506	oneindia	షాక్: పఠాన్ కోట్ సమీపంలో ఉగ్ర కలకలం, భద్రత దళాల గాలింపు	http://telugu.oneindia.com/news/india/pathankot-airbase-on-high-alert-search-operation-underway-197223.html	http://telugu.oneindia.com/img/2017/03/xterrorist-25-1480051657-jpg-pagespeed-ic-rx-g5dgb64-14-1489507926.jpg	\N	\N	2017-03-15
\.


--
-- Name: posts_s_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('posts_s_no_seq', 506, true);


--
-- Data for Name: sakshi_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sakshi_menu (s_no, title, link, sliderpage) FROM stdin;
1	ananthapur	http://www.sakshi.com/district/ananthapur	t
2	chittoor	http://www.sakshi.com/district/chittoor	t
3	east-godavari	http://www.sakshi.com/district/east-godavari	t
4	guntur	http://www.sakshi.com/district/guntur	t
5	krishna	http://www.sakshi.com/district/krishna	t
6	kurnool	http://www.sakshi.com/district/kurnool	t
7	prakasam	http://www.sakshi.com/district/prakasam	t
8	psr-nellore	http://www.sakshi.com/district/psr-nellore	t
9	srikakulam	http://www.sakshi.com/district/srikakulam	t
10	visakhapatnam	http://www.sakshi.com/district/visakhapatnam	t
11	vizianagaram	http://www.sakshi.com/district/vizianagaram	t
12	west-godavari	http://www.sakshi.com/district/west-godavari	t
13	ysr	http://www.sakshi.com/district/ysr	t
14	adilabad	http://www.sakshi.com/district/adilabad	t
18	warangal	http://www.sakshi.com/district/warangal	t
23	hyderabad-city	http://www.sakshi.com/district/hyderabad-city	t
24	nizamabad	http://www.sakshi.com/district/nizamabad	t
26	karimnagar	http://www.sakshi.com/district/karimnagar	t
30	khammam	http://www.sakshi.com/district/khammam	t
32	mahabubnagar	http://www.sakshi.com/district/mahabubnagar	t
36	medak	http://www.sakshi.com/district/medak	t
15	mancherial	http://www.sakshi.com/news/district-mancherial?district=mancherial	f
16	komaram-bheem	http://www.sakshi.com/news/district-komaram-bheem?district=komaram-bheem	f
17	nirmal	http://www.sakshi.com/news/district-nirmal?district=nirmal	f
19	warangal-rural	http://www.sakshi.com/news/district-warangal-rural?district=warangal-rural	f
20	mahabubabad	http://www.sakshi.com/news/district-mahabubabad?district=mahabubabad	f
21	jayashankar	http://www.sakshi.com/news/district-jayashankar?district=jayashankar	f
22	jangaon	http://www.sakshi.com/news/district-jangaon?district=jangaon	f
25	kamareddy	http://www.sakshi.com/news/district-kamareddy?district=kamareddy	f
27	jagtial	http://www.sakshi.com/news/district-jagtial?district=jagtial	f
28	peddapalli	http://www.sakshi.com/news/district-peddapalli?district=peddapalli	f
29	rajanna	http://www.sakshi.com/news/district-rajanna?district=rajanna	f
31	bhadradri	http://www.sakshi.com/news/district-bhadradri?district=bhadradri	f
33	nagarkurnool	http://www.sakshi.com/news/district-nagarkurnool?district=nagarkurnool	f
34	wanaparthy	http://www.sakshi.com/news/district-wanaparthy?district=wanaparthy	f
35	jogulamba	http://www.sakshi.com/news/district-jogulamba?district=jogulamba	f
37	siddipet	http://www.sakshi.com/news/district-siddipet?district=siddipet	f
38	sangareddy	http://www.sakshi.com/news/district-sangareddy?district=sangareddy	f
39	nalgonda	http://www.sakshi.com/district/nalgonda	t
42	ranga-reddy	http://www.sakshi.com/district/ranga-reddy	t
48	ప్రపంచం	http://www.sakshi.com/news/top-news-world	f
49	జాతీయం	http://www.sakshi.com/news/top-news-national	f
50	రాజకీయం	http://www.sakshi.com/news/top-news-politics	f
51	క్రైమ్	http://www.sakshi.com/news/top-news-crime	f
52	కరెన్సీ కష్టాలు	http://www.sakshi.com/news/top-news-currency-problems	f
54	వార్తలు	http://www.sakshi.com/news/andhra-pradesh-news	f
55	రాజకీయం	http://www.sakshi.com/news/andhra-pradesh-politics	f
57	వార్తలు	http://www.sakshi.com/news/telangana-news	f
58	రాజకీయం	http://www.sakshi.com/news/telangana-politics	f
59	 సినిమా	http://www.sakshi.com/cinema	t
60	క్రీడలు	http://www.sakshi.com/sports	t
61	బిజినెస్	http://www.sakshi.com/business	t
46	home	http://www.sakshi.com/	t
40	suryapet	http://www.sakshi.com/news/district-suryapet?district=suryapet	f
41	yadadri	http://www.sakshi.com/news/district-yadadri?district=yadadri	f
43	medchal	http://www.sakshi.com/news/district-medchal?district=medchal	f
44	vikarabad	http://www.sakshi.com/news/district-vikarabad?district=vikarabad	f
\.


--
-- Name: sakshi_menu_s_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sakshi_menu_s_no_seq', 75, true);


--
-- Data for Name: samayam_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY samayam_menu (s_no, title, link) FROM stdin;
1	telugu-movies	http://telugu.samayam.com/telugu-movies/articlelist/48238931.cms
2	social	http://telugu.samayam.com/social/articlelist/47120416.cms
3	latest-news	http://telugu.samayam.com/latest-news/articlelist/48239026.cms
4	sports-news	http://telugu.samayam.com/sports-news/articlelist/47921077.cms
5	business	http://telugu.samayam.com/business/articlelist/56181272.cms
\.


--
-- Name: samayam_menu_s_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('samayam_menu_s_no_seq', 5, true);


--
-- Data for Name: tupaki_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tupaki_menu (s_no, title, link, sliderpage) FROM stdin;
\.


--
-- Name: tupaki_menu_s_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tupaki_menu_s_no_seq', 1, false);


--
-- Name: abn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abn_menu
    ADD CONSTRAINT abn_pkey PRIMARY KEY (s_no);


--
-- Name: eenadu_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eenadu_menu
    ADD CONSTRAINT eenadu_menu_pkey PRIMARY KEY (s_no);


--
-- Name: ga_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ga_menu
    ADD CONSTRAINT ga_menu_pkey PRIMARY KEY (s_no);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (s_no);


--
-- Name: sakshi_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sakshi_menu
    ADD CONSTRAINT sakshi_menu_pkey PRIMARY KEY (s_no);


--
-- Name: samayam_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY samayam_menu
    ADD CONSTRAINT samayam_menu_pkey PRIMARY KEY (s_no);


--
-- Name: tupaki_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tupaki_menu
    ADD CONSTRAINT tupaki_menu_pkey PRIMARY KEY (s_no);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

