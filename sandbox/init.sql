--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Homebrew)
-- Dumped by pg_dump version 15.6 (Homebrew)

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
-- Name: cache; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO admin;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO admin;

--
-- Name: contests; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.contests (
    contest_id integer NOT NULL,
    rooid text,
    timestarted text,
    duration integer,
    completed boolean,
    started boolean
);


ALTER TABLE public.contests OWNER TO admin;

--
-- Name: contests_contest_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.contests_contest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contests_contest_id_seq OWNER TO admin;

--
-- Name: contests_contest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.contests_contest_id_seq OWNED BY public.contests.contest_id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO admin;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO admin;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO admin;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO admin;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO admin;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO admin;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO admin;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO admin;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: tolymbeknurtai
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    title character varying(255),
    content text,
    level character varying(50),
    input text,
    output text,
    input_format text,
    output_format text
);


ALTER TABLE public.questions OWNER TO tolymbeknurtai;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: tolymbeknurtai
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO tolymbeknurtai;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tolymbeknurtai
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO admin;

--
-- Name: test; Type: TABLE; Schema: public; Owner: tolymbeknurtai
--

CREATE TABLE public.test (
    id integer NOT NULL,
    question_id integer,
    input text,
    output text
);


ALTER TABLE public.test OWNER TO tolymbeknurtai;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: tolymbeknurtai
--

CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO tolymbeknurtai;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tolymbeknurtai
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: contests contest_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contests ALTER COLUMN contest_id SET DEFAULT nextval('public.contests_contest_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: tolymbeknurtai
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: test id; Type: DEFAULT; Schema: public; Owner: tolymbeknurtai
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: contests; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.contests (contest_id, rooid, timestarted, duration, completed, started) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_04_28_105734_create_personal_access_tokens_table	2
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: tolymbeknurtai
--

COPY public.questions (id, title, content, level, input, output, input_format, output_format) FROM stdin;
4	Add Two Numbers	Your task is very simple: given two integers A and B, write a program to add these two numbers and output the sum.	easy	1 2	3	One line with two integers.	Output the sum of the two integers.
5	Good Turn	Chef and Chefina are playing with dice. In one turn, both of them roll their dice at once. They consider a turn to be good if the sum of the numbers on their dice is greater than 6. Given that in a particular turn Chef and Chefina got X and Y on their respective dice, find whether the turn was good.	easy	3 4/1 4	NO/YES	\n    The first line of input will contain a single integer TT, denoting the number of test cases.\n    Each test case contains two space-separated integers XX and YY — the numbers Chef and Chefina got on their respective dice.\n	For each test case, output on a new line, YES, if the turn was good and NO otherwise.\n\nEach character of the output may be printed in either uppercase or lowercase. That is, the strings NO, no, nO, and No will be treated as equivalent.
6	Find Remainder	Write a program to find the remainder when an integer A is divided by an integer B.	easy	1 2/100 200	1/100	Two lines with two integers per line.	2 lines of output.Output the remainder when dividing the first integer to the second in each line.
11	Tickets	On a certain train, Chef-the ticket collector, collects a fine of Rs. X if a passenger is travelling without a ticket. It is known that a passenger carries either a single ticket or no ticket. P passengers are travelling and they have a total of Q tickets. Help Chef calculate the total fine collected.	easy	4/4 1 1/2 10 7/8 5 4/9 7 0	0/6/8/63	The first line contains a single integer TT, the number of test cases. TT lines follow. Each following line contains three integers separated by spaces, whose description follows.\n\n    The first integer, XX, is the fee in rupees.\n    The second integer, PP, is the number of passengers on the train.\n    The third integer, QQ, is the number of tickets Chef collected.\n	The output must consist of TT lines.\n\n    The i-th line must contain a single integer, the total money(in rupees) collected by Chef corresponding to the i-th test case.\n
12	6 Friends	Six friends go on a trip and are looking for accommodation. After looking for hours, they find a hotel which offers two types of rooms — double rooms and triple rooms. A double room costs Rs. X, while a triple room costs Rs. Y. The friends can either get three double rooms or get two triple rooms. Find the minimum amount they will have to pay to accommodate all six of them.	normal	3/10 15/6 8/4 8	30/16/12	\n    The first line contains a single integer TT - the number of test cases. Then the test cases follow.\n    The first and only line of each test case contains two integers XX and YY - the cost of a double room and the cost of a triple room.\n	For each testcase, output the minimum amount required to accommodate all the six friends.
13	2000	Chef had collected N notes of 2000 to pay his total college fees. However, the government banned 2000 notes. Chef wants to pay the same amount using 500 notes only. Find the number of notes Chef needs.	normal	4	16	Each test case consists of a single integer NN - the number of notes of Rs. 20002000 that Chef has collected.	Output a single integer - the number of Rs. 500500 notes needed.
1	Hello, world!	Welcome to Cactus! Make a program that prints the word Cactus to the screen.	easy	\N	Cactus	No input.	Output the answer in a single line.
7	Water Consumption	Recently, Chef visited his doctor. The doctor advised Chef to drink at least 2000 ml of water each day.\nChef drank X ml of water today. Determine if Chef followed the doctor`s advice or not.	easy	2/2555/2000	YES/YES	\n    The first line contains a single integer TT — the number of test cases. Then the test cases follow.\n    The first and only line of each test case contains one integer XX — the amount of water Chef drank today.\n	For each test case, output YES if Chef followed the doctor's advice of drinking at least 20002000 ml of water. Otherwise, output NO.\n\nYou may print each character of the string in uppercase or lowercase (for example, the strings YES, yEs, yes, and yeS will all be treated as identical).
8	Fit	Chef wants to become fit for which he decided to walk to the office and return home by walking. It is known that Chef`s office is X km away from his home. If his office is open on 5 days in a week, find the number of kilometers Chef travels through office trips in a week.	easy	2/2/3	20/30	\n    First line will contain TT, number of test cases. Then the test cases follow.\n    Each test case contains of a single line consisting of single integer XX.\n\n	For each test case, output the number of kilometers Chef travels through office trips in a week.
9	Burgers	Chef is fond of burgers and decided to make as many burgers as possible. Chef has A patties and B buns. To make 1 burger, Chef needs 1 patty and 1 bun. Find the maximum number of burgers that Chef can make.	easy	2/2 2/5 6	2/5	\n    The first line of input will contain an integer TT — the number of test cases. The description of TT test cases follows.\n    The first and only line of each test case contains two space-separated integers AA and BB, the number of patties and buns respectively.\n	For each test case, output the maximum number of burgers that Chef can make.
10	Marks & Happy	Alice has scored X marks in her test and Bob has scored Y marks in the same test. Alice is happy if she scored at least twice the marks of Bob’s score. Determine whether she is happy or not.	easy	2 2	NO	The first and only line of input contains two space-separated integers X,YX,Y — the marks of Alice and Bob respectively.	For each testcase, print Yes if Alice is happy and No if she is not, according to the problem statement.\n\nThe judge is case insensitive so you may output the answer in any case.
14	Tetris	Chef and Chefina are playing a game of Tetris together. In a single move, a player can either clear 1, 2, 3, or 4 lines of blocks. Clearing 4 lines in a single move is called getting a "Tetris". Chef and Chefina take turns playing, with Chef starting first. Whenever the current player clears only one line, the turn shifts to the other player; otherwise it remains with the current player. They will stop playing as soon as at least L lines are cleared in total. That is, the game stops when the sum of the number of lines cleared by both the players is at least L. Chef wants to end the game in style, and so would like to be the one who finishes the game and do so by getting a "Tetris", i.e, by clearing 4 lines. How many sequences of moves are there in which this happens? The number of sequences may be large, so print it modulo 10^9+7.	hard	4/3/2/4/100000	3/1/4/246691813	\n    The first line of input will contain a single integer TT, denoting the number of test cases.\n    Each test case consists of two lines of input:\n        The first line of each test case contains two space-separated integers, NN and KK, the number of boxes and the number of candies in each GroupGroup.\n        The second line contains NN space-separated numbers - A1,A2,…, An, the number of candies in the NN boxes.\n	For each test case, output in a new line, the maximum number of GroupsGroups that can be formed using the candies in the NN boxes, such that each GroupGroup consists of exactly KK candies and no two candies in the same GroupGroup have the same color.
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
AR2M7lvOp8GHzOMT8NdBK7jQv8n8lzmEzrfmSHuq	\N	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:125.0) Gecko/20100101 Firefox/125.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGVDWHY0YUdTazlqQVdRYWpIRzVYMXB4NnNKY3Y5YzFUOWNHaDVmdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9oZWxsbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1714288054
ojwOHkNabkg31ZISy9WD3NrQzIqODp21EEOuLtWr	\N	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEx2ZjVjZlhCSEliMmVNenlnc2tLQklwOTU5dlpoUm0wODAyc0lsayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9oZWxsb2h0bWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1714307025
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: tolymbeknurtai
--

COPY public.test (id, question_id, input, output) FROM stdin;
6	4	1 2	3
7	4	7 8	15
8	4	45 56	101
9	5	3 4/1 4	NO/YES
10	5	4/1 4/3 4/4 2/2 6	NO/YES/NO/YES
12	6	9 8/15 16	1/15
13	7	2/2555/2000	YES/YES
14	7	3/2999/1450/2000	YES/NO/YES
15	8	2/2/3	20/30
16	8	4/1/3/7/10	10/30/70/100
17	9	2/2 2/5 6	2/5
18	9	4/2 2/2 3/3 2/23 17	2/2/2/17
19	10	2 2	NO
20	10	5 2	YES
21	11	4/4 1 1/2 10 7/8 5 4/9 7 0	0/6/8/63
22	11	3/3 4 3/2 4 4/7 8 3	3/0/35
23	12	3/10 15/6 8/4 8	30/16/12
24	12	2/4 5/2 8	10/6
25	13	4	16
26	13	100	400
27	14	4/3/2/4/100000	3/1/4/246691813
28	14	3/2/3/4	1/3/4
1	1	null	Cactus
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- Name: contests_contest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.contests_contest_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.migrations_id_seq', 4, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tolymbeknurtai
--

SELECT pg_catalog.setval('public.questions_id_seq', 17, true);


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tolymbeknurtai
--

SELECT pg_catalog.setval('public.test_id_seq', 28, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: contests contests_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contests
    ADD CONSTRAINT contests_pkey PRIMARY KEY (contest_id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: tolymbeknurtai
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: questions questions_title_key; Type: CONSTRAINT; Schema: public; Owner: tolymbeknurtai
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_title_key UNIQUE (title);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: tolymbeknurtai
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: test test_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tolymbeknurtai
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- PostgreSQL database dump complete
--

