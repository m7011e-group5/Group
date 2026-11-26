--
-- PostgreSQL database dump
--

\restrict XjNHv3fGBIA6WGqmiF2WeUoqelEwXW4c5IFUg5pCeUVcRfu9ldjEgN5fMvw8GFS

-- Dumped from database version 18.7
-- Dumped by pg_dump version 18.7

-- Started on 2026-11-26 19:50:56

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
-- TOC entry 220 (class 1259 OID 16461)
-- Name: GroupMember; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GroupMember" (
    user_id uuid NOT NULL,
    group_id uuid NOT NULL,
    joined_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."GroupMember" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16451)
-- Name: StudyGroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StudyGroup" (
    group_id uuid NOT NULL,
    course_id integer NOT NULL,
    owner_id uuid NOT NULL,
    max_members integer NOT NULL,
    CONSTRAINT "StudyGroup_max_members_check" CHECK ((max_members > 0))
);


ALTER TABLE public."StudyGroup" OWNER TO postgres;

--
-- TOC entry 4864 (class 2606 OID 16468)
-- Name: GroupMember GroupMember_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupMember"
    ADD CONSTRAINT "GroupMember_pkey" PRIMARY KEY (user_id, group_id);


--
-- TOC entry 4862 (class 2606 OID 16460)
-- Name: StudyGroup StudyGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudyGroup"
    ADD CONSTRAINT "StudyGroup_pkey" PRIMARY KEY (group_id);


--
-- TOC entry 4865 (class 2606 OID 16469)
-- Name: GroupMember GroupMember_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupMember"
    ADD CONSTRAINT "GroupMember_group_id_fkey" FOREIGN KEY (group_id) REFERENCES public."StudyGroup"(group_id) ON DELETE CASCADE;


-- Completed on 2026-11-26 19:50:57

--
-- PostgreSQL database dump complete
--

\unrestrict XjNHv3fGBIA6WGqmiF2WeUoqelEwXW4c5IFUg5pCeUVcRfu9ldjEgN5fMvw8GFS

