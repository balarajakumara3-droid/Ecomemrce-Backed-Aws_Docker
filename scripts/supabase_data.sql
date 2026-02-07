Unable to find image 'postgres:17-alpine' locally
17-alpine: Pulling from library/postgres
7688a7195d19: Pulling fs layer
7457159af92b: Pulling fs layer
c3716bdff25f: Pulling fs layer
0c17960ea189: Pulling fs layer
d15ab3a99e6d: Pulling fs layer
8bab95e30c3d: Pulling fs layer
d45fbb8a6b19: Pulling fs layer
2ae3a3be5460: Pulling fs layer
8f5ffc2fd9c1: Pulling fs layer
7688a7195d19: Download complete
0c17960ea189: Download complete
7457159af92b: Download complete
c3716bdff25f: Download complete
d45fbb8a6b19: Download complete
8f5ffc2fd9c1: Download complete
8bab95e30c3d: Download complete
2ae3a3be5460: Download complete
7688a7195d19: Pull complete
7457159af92b: Pull complete
c3716bdff25f: Pull complete
d15ab3a99e6d: Download complete
d45fbb8a6b19: Pull complete
8bab95e30c3d: Pull complete
2ae3a3be5460: Pull complete
d15ab3a99e6d: Pull complete
0c17960ea189: Pull complete
8f5ffc2fd9c1: Pull complete
Digest: sha256:bb377b7239d2774ac8cc76f481596ce96c5a6b5e9d141f6d0a0ee371a6e7c0f2
Status: Downloaded newer image for postgres:17-alpine
--
-- PostgreSQL database dump
--

\restrict PNvB7SUighYmZ8prTbjg2H7UroGeXpNRZq7w05aMhpHhQbkji3YehOkqIEkWF6c

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.7

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	870bf8ff-3e3b-4416-a6e8-055dce2182a8	{"action":"user_confirmation_requested","actor_id":"0e8665b1-316c-471a-b72f-32224f33da3e","actor_username":"welcometothefuture@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-28 09:53:54.645738+00	
00000000-0000-0000-0000-000000000000	a52d4861-6d5d-4449-bf24-ce2a9f81e166	{"action":"user_confirmation_requested","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-28 10:04:52.850474+00	
00000000-0000-0000-0000-000000000000	f44a0018-ee79-4431-b438-8ef3f5cb6439	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"welcometothefuture@gmail.com","user_id":"0e8665b1-316c-471a-b72f-32224f33da3e","user_phone":""}}	2025-09-28 10:05:30.276514+00	
00000000-0000-0000-0000-000000000000	f4bdb1e5-f4e4-4f95-bbd3-30d92c20171b	{"action":"user_confirmation_requested","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-28 10:06:28.754689+00	
00000000-0000-0000-0000-000000000000	245df05a-de3e-4258-b9ae-af22ca64ae4d	{"action":"user_confirmation_requested","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-28 10:08:14.555317+00	
00000000-0000-0000-0000-000000000000	49ce0c86-9154-4e1a-b7d8-e8bbe7a8b90b	{"action":"user_signedup","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-28 10:08:43.983347+00	
00000000-0000-0000-0000-000000000000	57980191-f922-4891-877f-ce9f9b169430	{"action":"login","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-28 10:08:57.403992+00	
00000000-0000-0000-0000-000000000000	161901f6-4b4b-4e6a-be20-04997cff9d12	{"action":"login","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-28 10:09:24.135004+00	
00000000-0000-0000-0000-000000000000	1bb3aa92-434b-422b-8902-3dbdb13b946b	{"action":"login","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-28 10:09:47.233936+00	
00000000-0000-0000-0000-000000000000	3021c4b8-82eb-47cf-be80-a96158513fa0	{"action":"logout","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"account"}	2025-09-28 10:11:40.410967+00	
00000000-0000-0000-0000-000000000000	7f76bee6-d294-4c12-b358-ac0b62814b5a	{"action":"login","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-28 10:11:42.28915+00	
00000000-0000-0000-0000-000000000000	5261d095-ad49-4830-8a2c-ed5963312a87	{"action":"login","actor_id":"8ffe7c73-4edf-4f34-9190-6b75c1185791","actor_username":"vebage5411@protonza.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-28 10:13:14.134536+00	
00000000-0000-0000-0000-000000000000	dea4ebd9-0eb8-47cb-baf6-b3a0364f57eb	{"action":"user_confirmation_requested","actor_id":"5e078e30-5f6b-446c-800f-046f04bb1e92","actor_username":"gofoje2419@etenx.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-30 08:32:57.764457+00	
00000000-0000-0000-0000-000000000000	ae83aba2-f44a-4ab5-a6c9-49e44c1608c9	{"action":"user_signedup","actor_id":"5e078e30-5f6b-446c-800f-046f04bb1e92","actor_username":"gofoje2419@etenx.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-30 08:33:17.328353+00	
00000000-0000-0000-0000-000000000000	91258af1-3aaa-41f1-81d5-b8a9d1bd9ec1	{"action":"login","actor_id":"5e078e30-5f6b-446c-800f-046f04bb1e92","actor_username":"gofoje2419@etenx.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-30 08:33:20.688972+00	
00000000-0000-0000-0000-000000000000	919c7887-6c30-4e7e-8130-5e9f3faa9dbc	{"action":"user_confirmation_requested","actor_id":"4010c622-5454-4165-a618-ab30ca533bd0","actor_username":"xosoy66391@hiepth.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-30 11:16:00.945547+00	
00000000-0000-0000-0000-000000000000	2b001a32-c581-45ab-bf0e-d82c9951d3c1	{"action":"user_signedup","actor_id":"4010c622-5454-4165-a618-ab30ca533bd0","actor_username":"xosoy66391@hiepth.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-30 11:16:23.401851+00	
00000000-0000-0000-0000-000000000000	363c9ba8-8b3b-4cf1-94d6-5baa012e04d9	{"action":"token_refreshed","actor_id":"4010c622-5454-4165-a618-ab30ca533bd0","actor_username":"xosoy66391@hiepth.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 12:15:31.424764+00	
00000000-0000-0000-0000-000000000000	5b9e75f0-10f8-4365-8bd6-548538d632e1	{"action":"token_revoked","actor_id":"4010c622-5454-4165-a618-ab30ca533bd0","actor_username":"xosoy66391@hiepth.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 12:15:31.440152+00	
00000000-0000-0000-0000-000000000000	e60ee060-b3e8-4208-93f7-05e75a56d547	{"action":"user_confirmation_requested","actor_id":"4c3efa17-cafc-486f-8fbb-c397f600d285","actor_username":"yivirif637@bitmens.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-30 12:21:27.904689+00	
00000000-0000-0000-0000-000000000000	a468351f-c486-4cf6-8ebf-a5509f448363	{"action":"user_signedup","actor_id":"4c3efa17-cafc-486f-8fbb-c397f600d285","actor_username":"yivirif637@bitmens.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-30 12:21:37.46422+00	
00000000-0000-0000-0000-000000000000	be6479c8-f551-464f-b106-b68253817999	{"action":"token_refreshed","actor_id":"4c3efa17-cafc-486f-8fbb-c397f600d285","actor_username":"yivirif637@bitmens.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 13:23:24.320881+00	
00000000-0000-0000-0000-000000000000	2149d436-7f91-4bfc-9224-afd6a4f98fb3	{"action":"token_revoked","actor_id":"4c3efa17-cafc-486f-8fbb-c397f600d285","actor_username":"yivirif637@bitmens.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 13:23:24.345233+00	
00000000-0000-0000-0000-000000000000	07b7e661-d127-4b35-91e5-e2b8a3f64525	{"action":"user_confirmation_requested","actor_id":"cb26c571-6e94-4583-ab5c-a49a35f7d95e","actor_username":"filike@denipl.net","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-04 08:07:01.98716+00	
00000000-0000-0000-0000-000000000000	ec63ff47-5d1c-4404-895e-ee419d37e7e4	{"action":"user_signedup","actor_id":"cb26c571-6e94-4583-ab5c-a49a35f7d95e","actor_username":"filike@denipl.net","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-04 08:07:21.599506+00	
00000000-0000-0000-0000-000000000000	acaf4496-dfce-47c0-b927-b0de0a63f5ca	{"action":"login","actor_id":"cb26c571-6e94-4583-ab5c-a49a35f7d95e","actor_username":"filike@denipl.net","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 08:07:25.624253+00	
00000000-0000-0000-0000-000000000000	9d446e0e-633b-493a-aceb-217001e7fc9f	{"action":"user_confirmation_requested","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-04 08:12:05.193336+00	
00000000-0000-0000-0000-000000000000	107949d9-a207-4e7f-9eeb-38b7d251f2bb	{"action":"user_signedup","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-04 08:12:15.440294+00	
00000000-0000-0000-0000-000000000000	3c70eb2f-a3a5-4a6a-aa87-4ecaaeeeb931	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 08:12:22.377577+00	
00000000-0000-0000-0000-000000000000	29a86861-fd8d-4fb6-98e7-60053ceaa968	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 08:38:58.766201+00	
00000000-0000-0000-0000-000000000000	91c826b9-aa8c-4e32-a426-034a4882798c	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 08:39:13.80532+00	
00000000-0000-0000-0000-000000000000	0530fe3b-9083-4e6d-894b-edc311cb9650	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 09:50:37.135097+00	
00000000-0000-0000-0000-000000000000	4953fcba-b418-4d20-9ff7-3ac833bd3254	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 09:50:37.153928+00	
00000000-0000-0000-0000-000000000000	122beafd-8c13-45e3-b760-0242ff55e8c6	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 10:35:02.091266+00	
00000000-0000-0000-0000-000000000000	6d09f9d4-6ef5-4477-8fa9-ae89bda3224b	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 11:37:57.821329+00	
00000000-0000-0000-0000-000000000000	8821ad9f-32fa-4f29-9dd8-4963f569e8e0	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 11:37:57.840165+00	
00000000-0000-0000-0000-000000000000	a94635e6-bb84-4b99-9598-7a4f23454393	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 12:37:15.31571+00	
00000000-0000-0000-0000-000000000000	02c01979-7b04-4ebc-a4a2-f1bffd52dd97	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 12:37:15.335709+00	
00000000-0000-0000-0000-000000000000	c2e8c101-0459-466b-99b1-150bb5bc40b0	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 13:49:13.124235+00	
00000000-0000-0000-0000-000000000000	556a3d59-a0ff-4704-9bd2-048f41767a33	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 13:49:13.145629+00	
00000000-0000-0000-0000-000000000000	cd74b0c3-9382-4693-b3cc-e0d40e85171e	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 14:48:02.056287+00	
00000000-0000-0000-0000-000000000000	59ab7dbd-7308-4537-96a5-742c2163ae2c	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 14:48:02.063339+00	
00000000-0000-0000-0000-000000000000	6a6a27da-4fb0-4014-88de-09328895eb68	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 15:46:51.335945+00	
00000000-0000-0000-0000-000000000000	90f9b6f8-4ea1-49fb-ac0b-98feb6db466a	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 15:46:51.356943+00	
00000000-0000-0000-0000-000000000000	2a19d206-c865-4e47-9d0a-e52cab69755b	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:18:39.731708+00	
00000000-0000-0000-0000-000000000000	c1a392f5-e33c-4712-bcf6-9df3694f74c1	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:39:46.712566+00	
00000000-0000-0000-0000-000000000000	8f4698ec-c508-40ba-9c89-614eda3ce69f	{"action":"user_confirmation_requested","actor_id":"481f7408-e9d6-4a4e-b3f5-85268235a47e","actor_username":"testuser@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-04 16:47:17.371079+00	
00000000-0000-0000-0000-000000000000	60f153df-7473-46e4-8389-b7bf58099426	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:48:02.925232+00	
00000000-0000-0000-0000-000000000000	fee6f4c3-7fed-44a5-bbbd-68b13cb99b53	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:48:31.919591+00	
00000000-0000-0000-0000-000000000000	77e5e493-7b4c-4fa4-b1ae-36bf67ccbd92	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:50:55.193242+00	
00000000-0000-0000-0000-000000000000	fe7d3c00-ebb8-4668-bcd8-39b57dacf3a7	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:51:52.637827+00	
00000000-0000-0000-0000-000000000000	d14ff66e-5b78-41d7-b8b6-8577cc64d0e3	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:51:57.992322+00	
00000000-0000-0000-0000-000000000000	8e4cf4d9-6bb8-4fd2-94cf-5656b3f7cfac	{"action":"logout","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account"}	2025-10-04 16:54:12.911815+00	
00000000-0000-0000-0000-000000000000	74864c50-f3a6-40cb-bb90-f706e0718e9b	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:54:58.691233+00	
00000000-0000-0000-0000-000000000000	4b53f935-36ad-476c-91f7-ce7d55419515	{"action":"logout","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account"}	2025-10-04 16:55:22.051074+00	
00000000-0000-0000-0000-000000000000	3fe21d05-af75-4729-9507-dd027e19be7a	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 16:55:35.191016+00	
00000000-0000-0000-0000-000000000000	cc65be20-cbf5-4289-8941-6cd1a4f4d71f	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 17:07:53.310565+00	
00000000-0000-0000-0000-000000000000	642f4c43-43c2-4668-ae5a-7f6284dfcddc	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-04 17:14:56.577948+00	
00000000-0000-0000-0000-000000000000	7398e660-69f7-47b3-a2a6-10424cb8bd45	{"action":"token_refreshed","actor_id":"cb26c571-6e94-4583-ab5c-a49a35f7d95e","actor_username":"filike@denipl.net","actor_via_sso":false,"log_type":"token"}	2025-10-05 04:25:39.463535+00	
00000000-0000-0000-0000-000000000000	8b998f62-4c78-482f-b38a-52c6611aada8	{"action":"token_revoked","actor_id":"cb26c571-6e94-4583-ab5c-a49a35f7d95e","actor_username":"filike@denipl.net","actor_via_sso":false,"log_type":"token"}	2025-10-05 04:25:39.482879+00	
00000000-0000-0000-0000-000000000000	388e2adc-0efd-434a-8934-706374294f9a	{"action":"token_refreshed","actor_id":"cb26c571-6e94-4583-ab5c-a49a35f7d95e","actor_username":"filike@denipl.net","actor_via_sso":false,"log_type":"token"}	2025-10-05 05:24:56.738822+00	
00000000-0000-0000-0000-000000000000	37df6d06-c74b-4ce1-952d-c8b4d1a9dc8e	{"action":"token_revoked","actor_id":"cb26c571-6e94-4583-ab5c-a49a35f7d95e","actor_username":"filike@denipl.net","actor_via_sso":false,"log_type":"token"}	2025-10-05 05:24:56.760116+00	
00000000-0000-0000-0000-000000000000	022debce-6d8e-4b22-8fee-e17cbee93a20	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 02:48:51.475676+00	
00000000-0000-0000-0000-000000000000	8854c8c3-3bde-4b4e-b517-d46068d9cd2a	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 02:48:51.50115+00	
00000000-0000-0000-0000-000000000000	f9af775d-d0cf-4a2e-b04d-96306e8007c4	{"action":"logout","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 03:15:57.609075+00	
00000000-0000-0000-0000-000000000000	f247be16-871a-474b-b9fa-296425dac787	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 03:16:01.79716+00	
00000000-0000-0000-0000-000000000000	9da3e793-55ae-4a2d-95d0-fe14b95a1435	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 04:17:56.081798+00	
00000000-0000-0000-0000-000000000000	2e66ee37-16f8-4e7d-b99a-8bd2352cfb17	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 04:17:56.106384+00	
00000000-0000-0000-0000-000000000000	11d513f5-eaf5-4b94-a427-cbca709d2ec5	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 10:53:28.682645+00	
00000000-0000-0000-0000-000000000000	41ca8805-dbbe-4572-b838-7a8dd03ba46b	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 10:53:28.700588+00	
00000000-0000-0000-0000-000000000000	e420f2b9-936b-45be-a51a-cb4c03aefd99	{"action":"logout","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 11:29:10.07887+00	
00000000-0000-0000-0000-000000000000	6f0960a7-d713-4a9b-893c-7aac767eca7b	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 11:29:14.392709+00	
00000000-0000-0000-0000-000000000000	f282f86d-4ea5-443a-b37a-0182ba879e1c	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 12:28:05.289125+00	
00000000-0000-0000-0000-000000000000	5a520b89-d871-48fa-a503-12ba9eab70a2	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 12:28:05.305587+00	
00000000-0000-0000-0000-000000000000	542fe07e-1a0f-4268-88d4-2ad06fef02eb	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 13:27:23.460236+00	
00000000-0000-0000-0000-000000000000	3d704703-64d6-4c32-b606-a2144b0da43b	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 13:27:23.476647+00	
00000000-0000-0000-0000-000000000000	de6abf38-a959-4bb5-9585-a58866c50744	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 14:26:22.848738+00	
00000000-0000-0000-0000-000000000000	7cf1a73e-19bb-4ea1-adf6-247499b4c668	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 14:26:22.866646+00	
00000000-0000-0000-0000-000000000000	e9dd351c-d24b-4a7c-9151-2db0daf388d6	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 03:30:28.874225+00	
00000000-0000-0000-0000-000000000000	80bf9c6f-a6d7-4345-b479-83d251654bc0	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 03:30:28.886416+00	
00000000-0000-0000-0000-000000000000	84e1dfa8-aee9-4b99-a06d-1501fd8e04b4	{"action":"token_refreshed","actor_id":"5e078e30-5f6b-446c-800f-046f04bb1e92","actor_username":"gofoje2419@etenx.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 04:20:54.7741+00	
00000000-0000-0000-0000-000000000000	d0d4ea9a-012d-4596-b1ad-4b5447aca453	{"action":"token_revoked","actor_id":"5e078e30-5f6b-446c-800f-046f04bb1e92","actor_username":"gofoje2419@etenx.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 04:20:54.784414+00	
00000000-0000-0000-0000-000000000000	d1778df8-922b-4085-a946-12d97ca0acc3	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 04:29:47.468915+00	
00000000-0000-0000-0000-000000000000	152faffa-43f2-4940-8de1-056f5e35aab4	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 04:29:47.472808+00	
00000000-0000-0000-0000-000000000000	296ac48e-4179-4b21-a4e4-52872d877454	{"action":"token_refreshed","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 05:48:45.40699+00	
00000000-0000-0000-0000-000000000000	26591ec8-3441-4ff0-92f5-de4feb67e036	{"action":"token_revoked","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 05:48:45.427615+00	
00000000-0000-0000-0000-000000000000	076bd701-483e-4919-b311-9a52a9b28922	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 05:49:00.218627+00	
00000000-0000-0000-0000-000000000000	d6328594-d215-476d-8c8a-31e51189f538	{"action":"user_recovery_requested","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-10-07 05:52:31.823706+00	
00000000-0000-0000-0000-000000000000	87b7b4ac-5de9-4736-a18b-cbe3818100bb	{"action":"user_signedup","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-07 05:52:48.236596+00	
00000000-0000-0000-0000-000000000000	82205bcc-4de5-4e1c-94b2-b5a38d2f496a	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"viewdodload@gmail.com","user_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","user_phone":""}}	2025-10-07 06:00:17.921303+00	
00000000-0000-0000-0000-000000000000	5264555c-1372-4206-886c-a511babdd344	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:00:32.514491+00	
00000000-0000-0000-0000-000000000000	9168bd6c-65f9-452f-be1f-5de05153b25b	{"action":"logout","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 06:00:34.027826+00	
00000000-0000-0000-0000-000000000000	5e688cff-6dd1-4dc1-9eb3-78d7dbcc3b98	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:01:44.316208+00	
00000000-0000-0000-0000-000000000000	802aa8c8-d4e4-4772-93d1-da44eb46a54d	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:02:41.14625+00	
00000000-0000-0000-0000-000000000000	16d82e43-da69-4274-a7be-949a8fe4f277	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:03:02.9714+00	
00000000-0000-0000-0000-000000000000	1c816f03-38af-4136-9ee6-baec5a9cbe7f	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:04:06.820271+00	
00000000-0000-0000-0000-000000000000	2352405a-2d64-454c-992e-2fc777ecdb40	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:10:36.179231+00	
00000000-0000-0000-0000-000000000000	70b01035-28d0-4432-940a-a74ae251af27	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"viewdodload@gmail.com","user_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","user_phone":""}}	2025-10-07 06:16:47.202114+00	
00000000-0000-0000-0000-000000000000	9f9476e4-3e85-4f16-8509-5e24d3d18173	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:18:08.097723+00	
00000000-0000-0000-0000-000000000000	df28bc4b-44f8-47b8-a58b-e4bd48545a69	{"action":"logout","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 06:18:14.06712+00	
00000000-0000-0000-0000-000000000000	e67ec9df-a0f0-433e-9769-cd3f47e09535	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:18:50.007422+00	
00000000-0000-0000-0000-000000000000	71c7b77d-2cb6-4031-a33d-cb9cc77250af	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:18:56.276417+00	
00000000-0000-0000-0000-000000000000	7aa8714f-9faf-4a0c-b842-df29c201deb5	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:20:42.125936+00	
00000000-0000-0000-0000-000000000000	964ae3da-6be6-455a-b698-c9e9f446d6d9	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:20:54.765947+00	
00000000-0000-0000-0000-000000000000	a39842fb-9bdf-413e-82a8-f3ca53b192c1	{"action":"logout","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 06:21:14.19511+00	
00000000-0000-0000-0000-000000000000	6718807d-3b26-4340-b40c-984ca96074b1	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:21:50.001219+00	
00000000-0000-0000-0000-000000000000	9bc599fb-2a65-4a3d-b4cd-4476cf771143	{"action":"logout","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 06:21:54.682038+00	
00000000-0000-0000-0000-000000000000	6c8059df-973f-4e74-b7e3-c4d87f095b3c	{"action":"login","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 06:22:45.195124+00	
00000000-0000-0000-0000-000000000000	a351da41-e66c-4819-971e-bdda022a015c	{"action":"logout","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 06:22:49.490153+00	
00000000-0000-0000-0000-000000000000	5ccea506-c651-4875-82a2-137afcd1dc9c	{"action":"user_signedup","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-31 12:21:35.510337+00	
00000000-0000-0000-0000-000000000000	cb703589-c059-49d3-be00-6c319d5a4281	{"action":"login","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:21:35.527087+00	
00000000-0000-0000-0000-000000000000	e11cc010-9695-4347-b441-c5878426eb2d	{"action":"login","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:21:52.364941+00	
00000000-0000-0000-0000-000000000000	55e1917c-550b-421e-b38f-e9b6b2a42172	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 14:49:20.004882+00	
00000000-0000-0000-0000-000000000000	7313bae4-a48f-47bb-8d4f-ec9459ca4b4c	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 14:49:20.017131+00	
00000000-0000-0000-0000-000000000000	cfa5efdf-0e52-468c-ba06-1a477e7546a4	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 16:01:33.960452+00	
00000000-0000-0000-0000-000000000000	18a523dd-022e-44d8-bf4f-ebb1ad82530b	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 16:01:33.975955+00	
00000000-0000-0000-0000-000000000000	362ad977-a099-48c8-b1ed-542b62f59211	{"action":"login","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-01 05:24:41.363927+00	
00000000-0000-0000-0000-000000000000	f3d03e28-5a8c-441d-88e1-139c0cf3d625	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 06:26:14.077713+00	
00000000-0000-0000-0000-000000000000	e270765b-caf7-4d34-9941-0b50b4cfb218	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 06:26:14.095279+00	
00000000-0000-0000-0000-000000000000	d46a6d03-b57c-4921-929f-f53503aeb0d5	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 07:27:59.964995+00	
00000000-0000-0000-0000-000000000000	5a689217-2bd1-4ecd-a90b-648af549167e	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 07:27:59.987391+00	
00000000-0000-0000-0000-000000000000	ef245b2c-0228-45f6-bce3-ce11d3eb7c86	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 08:26:02.221393+00	
00000000-0000-0000-0000-000000000000	3e406ae3-d6f1-4a1c-b87d-853dc26e99b0	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 08:26:02.236191+00	
00000000-0000-0000-0000-000000000000	667d10f9-84d2-42c6-b926-02a341bb4963	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 09:24:18.607833+00	
00000000-0000-0000-0000-000000000000	3a71cbac-131a-43dc-a304-654879c762fb	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 09:24:18.626446+00	
00000000-0000-0000-0000-000000000000	4af8b75c-44d9-4c82-a91c-91720a7561d5	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 10:22:31.926096+00	
00000000-0000-0000-0000-000000000000	8325f548-ff25-4834-8eab-384ced1421ad	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 10:22:31.944806+00	
00000000-0000-0000-0000-000000000000	6c2b489c-1630-482d-8764-110a0303c28b	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 12:20:24.417262+00	
00000000-0000-0000-0000-000000000000	03a290b7-70da-4cc6-9215-4f1490ce6b8b	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 12:20:24.444077+00	
00000000-0000-0000-0000-000000000000	bb2b7632-5214-4e71-b26b-001556ffb15b	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 16:06:34.00472+00	
00000000-0000-0000-0000-000000000000	ef5df6d5-c99c-486b-9839-c64104b228d5	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 16:06:34.018825+00	
00000000-0000-0000-0000-000000000000	4c60f019-413e-4b34-91dd-8bcb11f05214	{"action":"logout","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-04 16:06:38.588029+00	
00000000-0000-0000-0000-000000000000	320bbd72-ca27-4288-809d-0b71e675b47c	{"action":"login","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-04 16:11:19.614128+00	
00000000-0000-0000-0000-000000000000	7dff13b0-d8bb-4aa9-a792-4f2120dbcacc	{"action":"logout","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-04 16:11:25.104122+00	
00000000-0000-0000-0000-000000000000	b1cf3768-ac7e-41f9-8f38-f4e493369817	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-10 07:37:21.760177+00	
00000000-0000-0000-0000-000000000000	4c7fbd4f-795f-4009-b9cf-9cf6c62dd797	{"action":"login","actor_id":"cca4138d-4349-477f-83d3-1f96687e3f66","actor_username":"xopoda@denipl.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-10 07:41:11.529265+00	
00000000-0000-0000-0000-000000000000	aecee8e6-a9b2-4513-a405-2790078338a4	{"action":"login","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-23 05:45:33.118699+00	
00000000-0000-0000-0000-000000000000	68f165fc-c7f4-46c4-a1fb-a6674c0d75c5	{"action":"token_refreshed","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-23 06:44:36.236134+00	
00000000-0000-0000-0000-000000000000	965e0115-dd87-4da4-8878-87e13f7fb5b4	{"action":"token_revoked","actor_id":"65567bd1-b1ff-4a54-9060-357973a502a1","actor_username":"idofshankar@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-23 06:44:36.256233+00	
00000000-0000-0000-0000-000000000000	60162892-f2ad-4469-8485-d36be9249941	{"action":"user_repeated_signup","actor_id":"57583c2e-4277-4ff8-a4db-2359346eae4c","actor_username":"viewdodload@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-12-18 06:15:28.461887+00	
00000000-0000-0000-0000-000000000000	65d40464-895d-4eda-8cb0-b35f17ca28ea	{"action":"user_signedup","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-12-18 06:16:21.836473+00	
00000000-0000-0000-0000-000000000000	2f786d12-134c-4b86-9e07-6cc0a338cf2b	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 06:16:21.850608+00	
00000000-0000-0000-0000-000000000000	255cb99c-bec9-4ee7-a29c-4aedfe048c84	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 06:16:29.159027+00	
00000000-0000-0000-0000-000000000000	c2eaa298-9f31-4847-b62c-b2596e961957	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 06:26:14.228507+00	
00000000-0000-0000-0000-000000000000	e40de676-c954-49da-be30-4e39362885c6	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:07:25.087209+00	
00000000-0000-0000-0000-000000000000	bc855b7e-9193-4b98-b19d-2419a9e76afb	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:08:26.727755+00	
00000000-0000-0000-0000-000000000000	be85ff78-4fec-4294-a0d2-845df7848eb4	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:11:32.986163+00	
00000000-0000-0000-0000-000000000000	244c0350-4bd6-4f60-a7d3-8f1f21b47677	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:11:56.752633+00	
00000000-0000-0000-0000-000000000000	5db3663b-417b-4180-a074-579d1e326f9a	{"action":"token_refreshed","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"token"}	2025-12-18 07:14:48.714046+00	
00000000-0000-0000-0000-000000000000	fc88bbf3-4968-4e41-847a-5fac9e72a3c9	{"action":"token_revoked","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"token"}	2025-12-18 07:14:48.721535+00	
00000000-0000-0000-0000-000000000000	a4a735b1-2528-49f0-bb25-42becc8f2db1	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:17:28.903099+00	
00000000-0000-0000-0000-000000000000	48dfd64a-e115-4f5d-a752-55ce18dbf620	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:21:24.722549+00	
00000000-0000-0000-0000-000000000000	31e36941-48f6-455c-9469-d58e610ceb43	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:22:08.645657+00	
00000000-0000-0000-0000-000000000000	ebcd8a2d-cf6f-4d37-9c35-c065a405308a	{"action":"login","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:24:42.560664+00	
00000000-0000-0000-0000-000000000000	b81d2bc4-30af-4b90-b49f-fd4a24c2c04f	{"action":"logout","actor_id":"1594ca26-055b-48c6-a60b-1b65cbf54a87","actor_username":"hosaj91475@m3player.com","actor_via_sso":false,"log_type":"account"}	2025-12-18 07:25:04.176693+00	
00000000-0000-0000-0000-000000000000	223a1e8e-512e-4066-b036-1b831ed3419e	{"action":"user_signedup","actor_id":"e8fac4bd-4c34-4ee6-94ed-58d706ce05f5","actor_username":"yomik91675@m3player.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-12-18 07:25:49.679329+00	
00000000-0000-0000-0000-000000000000	1d611f79-ecb6-4a7f-8f56-c36582f9e478	{"action":"login","actor_id":"e8fac4bd-4c34-4ee6-94ed-58d706ce05f5","actor_username":"yomik91675@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:25:49.689619+00	
00000000-0000-0000-0000-000000000000	e1a0cac0-2192-40bf-91da-0a8b444281c1	{"action":"login","actor_id":"e8fac4bd-4c34-4ee6-94ed-58d706ce05f5","actor_username":"yomik91675@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:26:30.515923+00	
00000000-0000-0000-0000-000000000000	5f51deeb-b560-4b2c-a2ea-47ce29e01e60	{"action":"login","actor_id":"e8fac4bd-4c34-4ee6-94ed-58d706ce05f5","actor_username":"yomik91675@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:28:09.295851+00	
00000000-0000-0000-0000-000000000000	9e707d84-b4c0-4b08-b12e-3da2ce56d7f2	{"action":"logout","actor_id":"e8fac4bd-4c34-4ee6-94ed-58d706ce05f5","actor_username":"yomik91675@m3player.com","actor_via_sso":false,"log_type":"account"}	2025-12-18 07:28:12.675712+00	
00000000-0000-0000-0000-000000000000	e177d562-ed1c-4c8d-a530-6087a0364fe6	{"action":"login","actor_id":"e8fac4bd-4c34-4ee6-94ed-58d706ce05f5","actor_username":"yomik91675@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:31:26.284298+00	
00000000-0000-0000-0000-000000000000	7b82aae0-2f25-4d0b-8a75-0161bc99b6b9	{"action":"login","actor_id":"e8fac4bd-4c34-4ee6-94ed-58d706ce05f5","actor_username":"yomik91675@m3player.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 07:32:02.710159+00	
00000000-0000-0000-0000-000000000000	31840a60-ffd1-4088-82f4-4bf7e910ff81	{"action":"user_signedup","actor_id":"ddee15b8-b3ef-4dbc-9015-cc34ccb013a4","actor_username":"njk81649@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-12-18 12:45:13.305535+00	
00000000-0000-0000-0000-000000000000	469f580f-f3fa-43d5-ab48-165abc7d39bc	{"action":"login","actor_id":"ddee15b8-b3ef-4dbc-9015-cc34ccb013a4","actor_username":"njk81649@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 12:45:13.345348+00	
00000000-0000-0000-0000-000000000000	6159512c-7a6f-4049-8e3c-6480d1bd04ca	{"action":"user_signedup","actor_id":"236816a9-de5f-4b3c-980e-e9532b152910","actor_username":"akelesh66@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-02-02 16:46:57.932164+00	
00000000-0000-0000-0000-000000000000	d884f3a8-c6b3-408a-a574-b4797f488975	{"action":"login","actor_id":"236816a9-de5f-4b3c-980e-e9532b152910","actor_username":"akelesh66@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-02 16:46:57.961793+00	
00000000-0000-0000-0000-000000000000	5a0ec737-4a4a-42f9-bb2a-62bc57ce2209	{"action":"login","actor_id":"236816a9-de5f-4b3c-980e-e9532b152910","actor_username":"akelesh66@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-02 16:47:56.975938+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	8ffe7c73-4edf-4f34-9190-6b75c1185791	authenticated	authenticated	vebage5411@protonza.com	$2a$10$QuRulbX/hIN7P9rJ/4Rteu44t0pJ9fPY8vgWdjPEIuizwG.OG1wla	2025-09-28 10:08:43.985104+00	\N		2025-09-28 10:08:14.556563+00		\N			\N	2025-09-28 10:13:14.152575+00	{"provider": "email", "providers": ["email"]}	{"sub": "8ffe7c73-4edf-4f34-9190-6b75c1185791", "email": "vebage5411@protonza.com", "email_verified": true, "phone_verified": false}	\N	2025-09-28 10:06:28.73967+00	2025-09-28 10:13:14.168911+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	5e078e30-5f6b-446c-800f-046f04bb1e92	authenticated	authenticated	gofoje2419@etenx.com	$2a$10$KZ6H52NoCnJOYHAyBSq3pewHafftTQfCEgJiFS8splPlQapv4q36a	2025-09-30 08:33:17.329124+00	\N		2025-09-30 08:32:57.774584+00		\N			\N	2025-09-30 08:33:20.689986+00	{"provider": "email", "providers": ["email"]}	{"sub": "5e078e30-5f6b-446c-800f-046f04bb1e92", "email": "gofoje2419@etenx.com", "email_verified": true, "phone_verified": false}	\N	2025-09-30 08:32:57.684572+00	2025-10-07 04:20:54.795251+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	4c3efa17-cafc-486f-8fbb-c397f600d285	authenticated	authenticated	yivirif637@bitmens.com	$2a$10$CWkhtYfrlajnPGgl.88GUO0kO5EwW2z6.9r.6/wRW89HkLwBsTDUm	2025-09-30 12:21:37.465542+00	\N		2025-09-30 12:21:27.907475+00		\N			\N	2025-09-30 12:21:37.471653+00	{"provider": "email", "providers": ["email"]}	{"sub": "4c3efa17-cafc-486f-8fbb-c397f600d285", "email": "yivirif637@bitmens.com", "email_verified": true, "phone_verified": false}	\N	2025-09-30 12:21:27.856223+00	2025-09-30 13:23:24.380583+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	4010c622-5454-4165-a618-ab30ca533bd0	authenticated	authenticated	xosoy66391@hiepth.com	$2a$10$q1h/sw1q6m9XbhLYFasVPukJrCmai5tjphjiXpnvJLYJ4k9gPWcPy	2025-09-30 11:16:23.404155+00	\N		2025-09-30 11:16:00.963643+00		\N			\N	2025-09-30 11:16:23.418673+00	{"provider": "email", "providers": ["email"]}	{"sub": "4010c622-5454-4165-a618-ab30ca533bd0", "email": "xosoy66391@hiepth.com", "email_verified": true, "phone_verified": false}	\N	2025-09-30 11:16:00.809161+00	2025-09-30 12:15:31.462951+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	481f7408-e9d6-4a4e-b3f5-85268235a47e	authenticated	authenticated	testuser@gmail.com	$2a$10$/94ucH3EVIxaOzzgTacJz.Pje3ZGGaT3UEcCgox2v/lRUdou1TBXe	\N	\N	cdfd3d41af644e89e95a8dda50724c3c3f03427e2c0b6d318b3a2074	2025-10-04 16:47:17.374117+00		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"sub": "481f7408-e9d6-4a4e-b3f5-85268235a47e", "email": "testuser@gmail.com", "email_verified": false, "phone_verified": false}	\N	2025-10-04 16:47:17.358142+00	2025-10-04 16:47:18.287544+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	57583c2e-4277-4ff8-a4db-2359346eae4c	authenticated	authenticated	viewdodload@gmail.com	$2a$10$g74llr/tTgy3CWHFhgjGdeqmhBBIsLwGuGp9EzREq1XHt98wEfMKa	2025-10-07 05:52:48.237582+00	\N		\N		\N			\N	2025-10-07 06:22:45.208392+00	{"provider": "email", "providers": ["email"]}	{"sub": "57583c2e-4277-4ff8-a4db-2359346eae4c", "email": "viewdodload@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-09-28 10:04:52.816702+00	2025-10-07 06:22:45.231961+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	cb26c571-6e94-4583-ab5c-a49a35f7d95e	authenticated	authenticated	filike@denipl.net	$2a$10$nPGTUboHkpjjreKfsM0qKeHOMh8V.Aquof.SU6aR8mk2830SFHc86	2025-10-04 08:07:21.600868+00	\N		2025-10-04 08:07:02.000168+00		\N			\N	2025-10-04 08:07:25.624982+00	{"provider": "email", "providers": ["email"]}	{"sub": "cb26c571-6e94-4583-ab5c-a49a35f7d95e", "email": "filike@denipl.net", "email_verified": true, "phone_verified": false}	\N	2025-10-04 08:07:01.88329+00	2025-10-05 05:24:56.800052+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	ddee15b8-b3ef-4dbc-9015-cc34ccb013a4	authenticated	authenticated	njk81649@gmail.com	$2a$10$G4FyFJrdttzbDv0UV5w9yOa3FUHZJrGhhW1s0Hk7Rw9NuVsqiw0cW	2025-12-18 12:45:13.320993+00	\N		\N		\N			\N	2025-12-18 12:45:13.348854+00	{"provider": "email", "providers": ["email"]}	{"sub": "ddee15b8-b3ef-4dbc-9015-cc34ccb013a4", "email": "njk81649@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-12-18 12:45:13.219047+00	2025-12-18 12:45:13.414424+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	cca4138d-4349-477f-83d3-1f96687e3f66	authenticated	authenticated	xopoda@denipl.com	$2a$10$iv0Rv./FnARqvsQO6cuXCO5FnKX3BGrZj8uyoOB57pa0BtOUnlm4e	2025-10-04 08:12:15.440946+00	\N		2025-10-04 08:12:05.194639+00		\N			\N	2025-11-10 07:41:11.541597+00	{"provider": "email", "providers": ["email"]}	{"sub": "cca4138d-4349-477f-83d3-1f96687e3f66", "email": "xopoda@denipl.com", "email_verified": true, "phone_verified": false}	\N	2025-10-04 08:12:05.180862+00	2025-11-10 07:41:11.54792+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	authenticated	authenticated	yomik91675@m3player.com	$2a$10$0/O06I.TOyCAkLq4JahNdenkwXV7chLTKNwbw.GlohSMmG6F5lWLO	2025-12-18 07:25:49.68012+00	\N		\N		\N			\N	2025-12-18 07:32:02.7112+00	{"provider": "email", "providers": ["email"]}	{"sub": "e8fac4bd-4c34-4ee6-94ed-58d706ce05f5", "email": "yomik91675@m3player.com", "email_verified": true, "phone_verified": false}	\N	2025-12-18 07:25:49.653633+00	2025-12-18 07:32:02.713198+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	65567bd1-b1ff-4a54-9060-357973a502a1	authenticated	authenticated	idofshankar@gmail.com	$2a$10$0LAIK5zra4qdXhEopsB3suDX7RgKuMzN4F3kZhpgZnzExOyGU7rcK	2025-10-31 12:21:35.517985+00	\N		\N		\N			\N	2025-11-23 05:45:33.133736+00	{"provider": "email", "providers": ["email"]}	{"sub": "65567bd1-b1ff-4a54-9060-357973a502a1", "email": "idofshankar@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-10-31 12:21:35.467694+00	2025-11-23 06:44:36.289041+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	1594ca26-055b-48c6-a60b-1b65cbf54a87	authenticated	authenticated	hosaj91475@m3player.com	$2a$10$IU7UfSZYKZ6f/JChIsleMO6pk0aTr.5n1KFMqL8kAWD0oRr0ypiBi	2025-12-18 06:16:21.837654+00	\N		\N		\N			\N	2025-12-18 07:24:42.566432+00	{"provider": "email", "providers": ["email"]}	{"sub": "1594ca26-055b-48c6-a60b-1b65cbf54a87", "email": "hosaj91475@m3player.com", "email_verified": true, "phone_verified": false}	\N	2025-12-18 06:16:21.788117+00	2025-12-18 07:24:42.585567+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	236816a9-de5f-4b3c-980e-e9532b152910	authenticated	authenticated	akelesh66@gmail.com	$2a$10$rdnl4MU.9pnkwcHidDkJJOmTWncNMo8d.1q.xlMyru8MZhCSKK1d.	2026-02-02 16:46:57.937091+00	\N		\N		\N			\N	2026-02-02 16:47:56.977319+00	{"provider": "email", "providers": ["email"]}	{"sub": "236816a9-de5f-4b3c-980e-e9532b152910", "email": "akelesh66@gmail.com", "email_verified": true, "phone_verified": false}	\N	2026-02-02 16:46:57.865818+00	2026-02-02 16:47:56.980192+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
57583c2e-4277-4ff8-a4db-2359346eae4c	57583c2e-4277-4ff8-a4db-2359346eae4c	{"sub": "57583c2e-4277-4ff8-a4db-2359346eae4c", "email": "viewdodload@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-09-28 10:04:52.846779+00	2025-09-28 10:04:52.846836+00	2025-09-28 10:04:52.846836+00	eb9cf2ae-e9e7-4e4b-aa05-85d10a4391aa
8ffe7c73-4edf-4f34-9190-6b75c1185791	8ffe7c73-4edf-4f34-9190-6b75c1185791	{"sub": "8ffe7c73-4edf-4f34-9190-6b75c1185791", "email": "vebage5411@protonza.com", "email_verified": true, "phone_verified": false}	email	2025-09-28 10:06:28.750577+00	2025-09-28 10:06:28.750629+00	2025-09-28 10:06:28.750629+00	172d11ac-0e7b-4edd-a3a4-4f3f6b0faf31
5e078e30-5f6b-446c-800f-046f04bb1e92	5e078e30-5f6b-446c-800f-046f04bb1e92	{"sub": "5e078e30-5f6b-446c-800f-046f04bb1e92", "email": "gofoje2419@etenx.com", "email_verified": true, "phone_verified": false}	email	2025-09-30 08:32:57.749197+00	2025-09-30 08:32:57.749252+00	2025-09-30 08:32:57.749252+00	88bc43b4-35ec-425e-aff6-0f1fac599fd8
4010c622-5454-4165-a618-ab30ca533bd0	4010c622-5454-4165-a618-ab30ca533bd0	{"sub": "4010c622-5454-4165-a618-ab30ca533bd0", "email": "xosoy66391@hiepth.com", "email_verified": true, "phone_verified": false}	email	2025-09-30 11:16:00.922841+00	2025-09-30 11:16:00.923593+00	2025-09-30 11:16:00.923593+00	58db3287-304c-4894-b76c-1ff9704a603b
4c3efa17-cafc-486f-8fbb-c397f600d285	4c3efa17-cafc-486f-8fbb-c397f600d285	{"sub": "4c3efa17-cafc-486f-8fbb-c397f600d285", "email": "yivirif637@bitmens.com", "email_verified": true, "phone_verified": false}	email	2025-09-30 12:21:27.899767+00	2025-09-30 12:21:27.899819+00	2025-09-30 12:21:27.899819+00	4ce08025-0abe-40f9-b36f-d09c6df4ac5c
cb26c571-6e94-4583-ab5c-a49a35f7d95e	cb26c571-6e94-4583-ab5c-a49a35f7d95e	{"sub": "cb26c571-6e94-4583-ab5c-a49a35f7d95e", "email": "filike@denipl.net", "email_verified": true, "phone_verified": false}	email	2025-10-04 08:07:01.963171+00	2025-10-04 08:07:01.963828+00	2025-10-04 08:07:01.963828+00	ccbc1453-d888-49ed-9277-1eb22187f9ce
cca4138d-4349-477f-83d3-1f96687e3f66	cca4138d-4349-477f-83d3-1f96687e3f66	{"sub": "cca4138d-4349-477f-83d3-1f96687e3f66", "email": "xopoda@denipl.com", "email_verified": true, "phone_verified": false}	email	2025-10-04 08:12:05.189568+00	2025-10-04 08:12:05.189618+00	2025-10-04 08:12:05.189618+00	b282ec75-e8ee-4800-9316-cdb2641a5cb1
481f7408-e9d6-4a4e-b3f5-85268235a47e	481f7408-e9d6-4a4e-b3f5-85268235a47e	{"sub": "481f7408-e9d6-4a4e-b3f5-85268235a47e", "email": "testuser@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-10-04 16:47:17.368171+00	2025-10-04 16:47:17.36822+00	2025-10-04 16:47:17.36822+00	fd61ca95-0c47-4757-b6e0-5f9e7ebf6dcf
65567bd1-b1ff-4a54-9060-357973a502a1	65567bd1-b1ff-4a54-9060-357973a502a1	{"sub": "65567bd1-b1ff-4a54-9060-357973a502a1", "email": "idofshankar@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-10-31 12:21:35.496998+00	2025-10-31 12:21:35.497058+00	2025-10-31 12:21:35.497058+00	108ae169-e2ad-4f08-9fdb-26d3842553c4
1594ca26-055b-48c6-a60b-1b65cbf54a87	1594ca26-055b-48c6-a60b-1b65cbf54a87	{"sub": "1594ca26-055b-48c6-a60b-1b65cbf54a87", "email": "hosaj91475@m3player.com", "email_verified": false, "phone_verified": false}	email	2025-12-18 06:16:21.824091+00	2025-12-18 06:16:21.824145+00	2025-12-18 06:16:21.824145+00	00e304fd-a538-4968-9f3b-cf01e383f3d9
e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	{"sub": "e8fac4bd-4c34-4ee6-94ed-58d706ce05f5", "email": "yomik91675@m3player.com", "email_verified": false, "phone_verified": false}	email	2025-12-18 07:25:49.67083+00	2025-12-18 07:25:49.670893+00	2025-12-18 07:25:49.670893+00	7acb9de3-3242-4ffa-b762-adc968ba9cdd
ddee15b8-b3ef-4dbc-9015-cc34ccb013a4	ddee15b8-b3ef-4dbc-9015-cc34ccb013a4	{"sub": "ddee15b8-b3ef-4dbc-9015-cc34ccb013a4", "email": "njk81649@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-12-18 12:45:13.277634+00	2025-12-18 12:45:13.278267+00	2025-12-18 12:45:13.278267+00	a77767fd-85f4-40cb-93ff-d053cfc1c418
236816a9-de5f-4b3c-980e-e9532b152910	236816a9-de5f-4b3c-980e-e9532b152910	{"sub": "236816a9-de5f-4b3c-980e-e9532b152910", "email": "akelesh66@gmail.com", "email_verified": false, "phone_verified": false}	email	2026-02-02 16:46:57.903822+00	2026-02-02 16:46:57.905007+00	2026-02-02 16:46:57.905007+00	d355ef91-98f7-4668-893b-937324350640
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
5b05e539-18c5-4fa9-95d3-adaac81da102	8ffe7c73-4edf-4f34-9190-6b75c1185791	2025-09-28 10:11:42.290013+00	2025-09-28 10:11:42.290013+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	182.65.191.117	\N	\N	\N	\N	\N
c1153c5e-fc06-4953-9bf1-0227261674c2	8ffe7c73-4edf-4f34-9190-6b75c1185791	2025-09-28 10:13:14.152674+00	2025-09-28 10:13:14.152674+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	182.65.191.117	\N	\N	\N	\N	\N
71938cc6-d541-409d-90ae-cc43ca8b504a	5e078e30-5f6b-446c-800f-046f04bb1e92	2025-09-30 08:33:17.343237+00	2025-09-30 08:33:17.343237+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	182.65.191.117	\N	\N	\N	\N	\N
cd481ed4-57f0-4358-be75-fa7fbb0b4fd4	4010c622-5454-4165-a618-ab30ca533bd0	2025-09-30 11:16:23.41876+00	2025-09-30 12:15:31.47174+00	\N	aal1	\N	2025-09-30 12:15:31.470991	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	182.65.191.117	\N	\N	\N	\N	\N
1971d1c5-ed3f-4ba5-88bf-49e469d6c053	4c3efa17-cafc-486f-8fbb-c397f600d285	2025-09-30 12:21:37.471728+00	2025-09-30 13:23:24.388565+00	\N	aal1	\N	2025-09-30 13:23:24.388482	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	182.65.191.117	\N	\N	\N	\N	\N
9142fdeb-51da-4352-9b22-d75422bbd557	cb26c571-6e94-4583-ab5c-a49a35f7d95e	2025-10-04 08:07:21.606655+00	2025-10-04 08:07:21.606655+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.253.181	\N	\N	\N	\N	\N
22d2c915-baa8-4d59-8660-3bfd44749c4a	cb26c571-6e94-4583-ab5c-a49a35f7d95e	2025-10-04 08:07:25.625079+00	2025-10-05 05:24:56.814642+00	\N	aal1	\N	2025-10-05 05:24:56.813837	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.232.170	\N	\N	\N	\N	\N
63fd8376-30d4-4d05-b2c7-f6f3d15dccbc	cca4138d-4349-477f-83d3-1f96687e3f66	2025-10-07 06:18:50.008553+00	2025-10-07 06:18:50.008553+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.232.170	\N	\N	\N	\N	\N
344f0eea-fc32-458d-bc44-eaeedcfecdf0	cca4138d-4349-477f-83d3-1f96687e3f66	2025-10-07 06:18:56.27742+00	2025-10-07 06:18:56.27742+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.232.170	\N	\N	\N	\N	\N
3e1a60af-8e44-4359-8505-6ce422411ea4	cca4138d-4349-477f-83d3-1f96687e3f66	2025-10-07 06:20:42.127788+00	2025-10-07 06:20:42.127788+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.232.170	\N	\N	\N	\N	\N
7c40b657-2344-4d84-9944-70c09a222924	5e078e30-5f6b-446c-800f-046f04bb1e92	2025-09-30 08:33:20.69006+00	2025-10-07 04:20:54.800589+00	\N	aal1	\N	2025-10-07 04:20:54.800511	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.232.170	\N	\N	\N	\N	\N
51394e00-f205-407f-b368-b43332d847a7	cca4138d-4349-477f-83d3-1f96687e3f66	2025-10-06 11:29:14.401936+00	2025-10-07 05:48:45.465278+00	\N	aal1	\N	2025-10-07 05:48:45.4652	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.232.170	\N	\N	\N	\N	\N
554a9356-8846-4448-9170-eb049857e630	cca4138d-4349-477f-83d3-1f96687e3f66	2025-10-07 05:49:00.219807+00	2025-10-07 05:49:00.219807+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.232.170	\N	\N	\N	\N	\N
7d72c948-fac7-452c-9a5c-4554122af823	cca4138d-4349-477f-83d3-1f96687e3f66	2025-10-07 06:04:06.830201+00	2025-10-07 06:04:06.830201+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	122.173.232.170	\N	\N	\N	\N	\N
1cc8453c-3903-4819-8baf-2f8562326d1c	cca4138d-4349-477f-83d3-1f96687e3f66	2025-11-10 07:37:21.77662+00	2025-11-10 07:37:21.77662+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	84.17.47.124	\N	\N	\N	\N	\N
7d5e49f0-33d7-402e-a6e6-ea2e0b9dc0f1	cca4138d-4349-477f-83d3-1f96687e3f66	2025-11-10 07:41:11.541707+00	2025-11-10 07:41:11.541707+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	84.17.47.124	\N	\N	\N	\N	\N
dc37667d-58b7-4cb4-9914-917b375c9e21	65567bd1-b1ff-4a54-9060-357973a502a1	2025-11-23 05:45:33.134545+00	2025-11-23 06:44:36.298769+00	\N	aal1	\N	2025-11-23 06:44:36.298668	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	157.51.122.237	\N	\N	\N	\N	\N
c7f195a8-1fec-4016-9117-81e9fec0383a	e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	2025-12-18 07:31:26.301689+00	2025-12-18 07:31:26.301689+00	\N	aal1	\N	\N	NammaOoruMobile/1 CFNetwork/3860.300.31 Darwin/24.6.0	122.178.175.71	\N	\N	\N	\N	\N
d59bf6fd-e02c-4899-b502-38f1c6c3246b	e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	2025-12-18 07:32:02.711305+00	2025-12-18 07:32:02.711305+00	\N	aal1	\N	\N	NammaOoruMobile/1 CFNetwork/3860.300.31 Darwin/24.6.0	122.178.175.71	\N	\N	\N	\N	\N
5a2d4697-720a-4941-9d9d-9223fcce381e	ddee15b8-b3ef-4dbc-9015-cc34ccb013a4	2025-12-18 12:45:13.349569+00	2025-12-18 12:45:13.349569+00	\N	aal1	\N	\N	NammaOoruMobile/1 CFNetwork/3826.500.131 Darwin/25.2.0	116.73.121.108	\N	\N	\N	\N	\N
a2b233c0-9243-4316-8480-7aebac7c9d73	236816a9-de5f-4b3c-980e-e9532b152910	2026-02-02 16:46:57.963733+00	2026-02-02 16:46:57.963733+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	122.167.102.45	\N	\N	\N	\N	\N
07c0d95d-aa25-4af4-825f-1a5f7190fe4f	236816a9-de5f-4b3c-980e-e9532b152910	2026-02-02 16:47:56.977955+00	2026-02-02 16:47:56.977955+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	122.167.102.45	\N	\N	\N	\N	\N
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
5b05e539-18c5-4fa9-95d3-adaac81da102	2025-09-28 10:11:42.292775+00	2025-09-28 10:11:42.292775+00	password	0264db2c-da98-4019-8826-d90565412b17
c1153c5e-fc06-4953-9bf1-0227261674c2	2025-09-28 10:13:14.171363+00	2025-09-28 10:13:14.171363+00	password	ebc8feb1-8056-4a5e-bda5-3a2e3641b9e1
71938cc6-d541-409d-90ae-cc43ca8b504a	2025-09-30 08:33:17.383496+00	2025-09-30 08:33:17.383496+00	otp	07c054db-c7ac-427a-a91d-b4c4c20e4630
7c40b657-2344-4d84-9944-70c09a222924	2025-09-30 08:33:20.692987+00	2025-09-30 08:33:20.692987+00	password	330a9259-4bd1-4ecd-86b6-f2d92c360031
cd481ed4-57f0-4358-be75-fa7fbb0b4fd4	2025-09-30 11:16:23.456408+00	2025-09-30 11:16:23.456408+00	otp	a901824f-7e62-4435-849f-2389d40467df
1971d1c5-ed3f-4ba5-88bf-49e469d6c053	2025-09-30 12:21:37.477411+00	2025-09-30 12:21:37.477411+00	otp	2be9dce3-da26-4052-bc77-15986f685051
9142fdeb-51da-4352-9b22-d75422bbd557	2025-10-04 08:07:21.642253+00	2025-10-04 08:07:21.642253+00	otp	2ca91613-c0b0-4936-a220-d99b4e395da5
22d2c915-baa8-4d59-8660-3bfd44749c4a	2025-10-04 08:07:25.628332+00	2025-10-04 08:07:25.628332+00	password	dd31ac2b-c436-4ab7-a6ee-c3d538be2a69
51394e00-f205-407f-b368-b43332d847a7	2025-10-06 11:29:14.425403+00	2025-10-06 11:29:14.425403+00	password	e54c1c82-7508-4808-8189-d51dbbe7ae10
554a9356-8846-4448-9170-eb049857e630	2025-10-07 05:49:00.228525+00	2025-10-07 05:49:00.228525+00	password	81d19720-068c-4f44-b1aa-68d08f8178d0
7d72c948-fac7-452c-9a5c-4554122af823	2025-10-07 06:04:06.855006+00	2025-10-07 06:04:06.855006+00	password	ec64a98c-afb5-4f10-8aac-b6228461340a
63fd8376-30d4-4d05-b2c7-f6f3d15dccbc	2025-10-07 06:18:50.010587+00	2025-10-07 06:18:50.010587+00	password	f3fb2b41-88c8-4c10-9d12-aff34c342b69
344f0eea-fc32-458d-bc44-eaeedcfecdf0	2025-10-07 06:18:56.279482+00	2025-10-07 06:18:56.279482+00	password	2be92c87-2470-442a-bcde-07c34d76dc7e
3e1a60af-8e44-4359-8505-6ce422411ea4	2025-10-07 06:20:42.132989+00	2025-10-07 06:20:42.132989+00	password	b116f416-b9af-4314-8b71-453c7f5585c2
1cc8453c-3903-4819-8baf-2f8562326d1c	2025-11-10 07:37:21.821927+00	2025-11-10 07:37:21.821927+00	password	62ef2346-74ed-447f-a3b2-86e7777db0d7
7d5e49f0-33d7-402e-a6e6-ea2e0b9dc0f1	2025-11-10 07:41:11.549426+00	2025-11-10 07:41:11.549426+00	password	11a0e8ff-bf8c-4b6d-880f-310a26fc98e6
dc37667d-58b7-4cb4-9914-917b375c9e21	2025-11-23 05:45:33.156328+00	2025-11-23 05:45:33.156328+00	password	07ff0414-8618-48c8-a0f2-a423a67bfb10
c7f195a8-1fec-4016-9117-81e9fec0383a	2025-12-18 07:31:26.340964+00	2025-12-18 07:31:26.340964+00	password	d8d8ac8f-458a-4641-85ba-510b8c673e29
d59bf6fd-e02c-4899-b502-38f1c6c3246b	2025-12-18 07:32:02.713535+00	2025-12-18 07:32:02.713535+00	password	b65d0fa0-41d3-4476-be81-bfe28498172e
5a2d4697-720a-4941-9d9d-9223fcce381e	2025-12-18 12:45:13.415013+00	2025-12-18 12:45:13.415013+00	password	c4489c5e-95de-44c0-8c4c-08ed42c9b56f
a2b233c0-9243-4316-8480-7aebac7c9d73	2026-02-02 16:46:57.982597+00	2026-02-02 16:46:57.982597+00	password	e99d9639-bbf6-4490-a341-11cbc3ff595a
07c0d95d-aa25-4af4-825f-1a5f7190fe4f	2026-02-02 16:47:56.980501+00	2026-02-02 16:47:56.980501+00	password	2ba8b008-2243-4595-8b9a-06795e3efc1f
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
f9ba9f2e-f886-45a7-b4fe-7a8a4811cb1b	481f7408-e9d6-4a4e-b3f5-85268235a47e	confirmation_token	cdfd3d41af644e89e95a8dda50724c3c3f03427e2c0b6d318b3a2074	testuser@gmail.com	2025-10-04 16:47:18.3011	2025-10-04 16:47:18.3011
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	59	ng6ncqrhh326	cca4138d-4349-477f-83d3-1f96687e3f66	f	2025-10-07 06:18:50.009325+00	2025-10-07 06:18:50.009325+00	\N	63fd8376-30d4-4d05-b2c7-f6f3d15dccbc
00000000-0000-0000-0000-000000000000	60	emjyml43fonh	cca4138d-4349-477f-83d3-1f96687e3f66	f	2025-10-07 06:18:56.278223+00	2025-10-07 06:18:56.278223+00	\N	344f0eea-fc32-458d-bc44-eaeedcfecdf0
00000000-0000-0000-0000-000000000000	61	dmixafelhjnr	cca4138d-4349-477f-83d3-1f96687e3f66	f	2025-10-07 06:20:42.129012+00	2025-10-07 06:20:42.129012+00	\N	3e1a60af-8e44-4359-8505-6ce422411ea4
00000000-0000-0000-0000-000000000000	5	jbeih3erhh7m	8ffe7c73-4edf-4f34-9190-6b75c1185791	f	2025-09-28 10:11:42.290975+00	2025-09-28 10:11:42.290975+00	\N	5b05e539-18c5-4fa9-95d3-adaac81da102
00000000-0000-0000-0000-000000000000	6	kor26gf4va34	8ffe7c73-4edf-4f34-9190-6b75c1185791	f	2025-09-28 10:13:14.159309+00	2025-09-28 10:13:14.159309+00	\N	c1153c5e-fc06-4953-9bf1-0227261674c2
00000000-0000-0000-0000-000000000000	7	dgniadgwkowu	5e078e30-5f6b-446c-800f-046f04bb1e92	f	2025-09-30 08:33:17.357389+00	2025-09-30 08:33:17.357389+00	\N	71938cc6-d541-409d-90ae-cc43ca8b504a
00000000-0000-0000-0000-000000000000	9	yjihitnu7tcw	4010c622-5454-4165-a618-ab30ca533bd0	t	2025-09-30 11:16:23.434956+00	2025-09-30 12:15:31.440883+00	\N	cd481ed4-57f0-4358-be75-fa7fbb0b4fd4
00000000-0000-0000-0000-000000000000	10	l7nfkgcjb5jk	4010c622-5454-4165-a618-ab30ca533bd0	f	2025-09-30 12:15:31.454464+00	2025-09-30 12:15:31.454464+00	yjihitnu7tcw	cd481ed4-57f0-4358-be75-fa7fbb0b4fd4
00000000-0000-0000-0000-000000000000	11	pkcighhkrsnh	4c3efa17-cafc-486f-8fbb-c397f600d285	t	2025-09-30 12:21:37.473516+00	2025-09-30 13:23:24.350839+00	\N	1971d1c5-ed3f-4ba5-88bf-49e469d6c053
00000000-0000-0000-0000-000000000000	12	c7iku5cj6ctu	4c3efa17-cafc-486f-8fbb-c397f600d285	f	2025-09-30 13:23:24.369946+00	2025-09-30 13:23:24.369946+00	pkcighhkrsnh	1971d1c5-ed3f-4ba5-88bf-49e469d6c053
00000000-0000-0000-0000-000000000000	13	6ild6hhgdkxj	cb26c571-6e94-4583-ab5c-a49a35f7d95e	f	2025-10-04 08:07:21.616902+00	2025-10-04 08:07:21.616902+00	\N	9142fdeb-51da-4352-9b22-d75422bbd557
00000000-0000-0000-0000-000000000000	78	h7owyg53twv3	cca4138d-4349-477f-83d3-1f96687e3f66	f	2025-11-10 07:37:21.790959+00	2025-11-10 07:37:21.790959+00	\N	1cc8453c-3903-4819-8baf-2f8562326d1c
00000000-0000-0000-0000-000000000000	79	xicwazeiq6lm	cca4138d-4349-477f-83d3-1f96687e3f66	f	2025-11-10 07:41:11.543752+00	2025-11-10 07:41:11.543752+00	\N	7d5e49f0-33d7-402e-a6e6-ea2e0b9dc0f1
00000000-0000-0000-0000-000000000000	80	y2mzsgu5gdsz	65567bd1-b1ff-4a54-9060-357973a502a1	t	2025-11-23 05:45:33.144945+00	2025-11-23 06:44:36.257587+00	\N	dc37667d-58b7-4cb4-9914-917b375c9e21
00000000-0000-0000-0000-000000000000	81	twhqaaxw3ncx	65567bd1-b1ff-4a54-9060-357973a502a1	f	2025-11-23 06:44:36.276218+00	2025-11-23 06:44:36.276218+00	y2mzsgu5gdsz	dc37667d-58b7-4cb4-9914-917b375c9e21
00000000-0000-0000-0000-000000000000	14	7aqizqxq22ky	cb26c571-6e94-4583-ab5c-a49a35f7d95e	t	2025-10-04 08:07:25.625796+00	2025-10-05 04:25:39.484226+00	\N	22d2c915-baa8-4d59-8660-3bfd44749c4a
00000000-0000-0000-0000-000000000000	36	7cqsjcco7jam	cb26c571-6e94-4583-ab5c-a49a35f7d95e	t	2025-10-05 04:25:39.502099+00	2025-10-05 05:24:56.767972+00	7aqizqxq22ky	22d2c915-baa8-4d59-8660-3bfd44749c4a
00000000-0000-0000-0000-000000000000	37	6kf3itd6bl2b	cb26c571-6e94-4583-ab5c-a49a35f7d95e	f	2025-10-05 05:24:56.791258+00	2025-10-05 05:24:56.791258+00	7cqsjcco7jam	22d2c915-baa8-4d59-8660-3bfd44749c4a
00000000-0000-0000-0000-000000000000	42	f6jql5aujj7v	cca4138d-4349-477f-83d3-1f96687e3f66	t	2025-10-06 11:29:14.40966+00	2025-10-06 12:28:05.306961+00	\N	51394e00-f205-407f-b368-b43332d847a7
00000000-0000-0000-0000-000000000000	43	cyxas7j7popd	cca4138d-4349-477f-83d3-1f96687e3f66	t	2025-10-06 12:28:05.32159+00	2025-10-06 13:27:23.477377+00	f6jql5aujj7v	51394e00-f205-407f-b368-b43332d847a7
00000000-0000-0000-0000-000000000000	44	e5hdsvbinqvp	cca4138d-4349-477f-83d3-1f96687e3f66	t	2025-10-06 13:27:23.494782+00	2025-10-06 14:26:22.868634+00	cyxas7j7popd	51394e00-f205-407f-b368-b43332d847a7
00000000-0000-0000-0000-000000000000	45	o3zn5uxiqix4	cca4138d-4349-477f-83d3-1f96687e3f66	t	2025-10-06 14:26:22.887389+00	2025-10-07 03:30:28.887557+00	e5hdsvbinqvp	51394e00-f205-407f-b368-b43332d847a7
00000000-0000-0000-0000-000000000000	8	eptrodflqezh	5e078e30-5f6b-446c-800f-046f04bb1e92	t	2025-09-30 08:33:20.690948+00	2025-10-07 04:20:54.785829+00	\N	7c40b657-2344-4d84-9944-70c09a222924
00000000-0000-0000-0000-000000000000	47	j6bhszh4yaav	5e078e30-5f6b-446c-800f-046f04bb1e92	f	2025-10-07 04:20:54.791144+00	2025-10-07 04:20:54.791144+00	eptrodflqezh	7c40b657-2344-4d84-9944-70c09a222924
00000000-0000-0000-0000-000000000000	46	kzzcu2hoxudx	cca4138d-4349-477f-83d3-1f96687e3f66	t	2025-10-07 03:30:28.896839+00	2025-10-07 04:29:47.473382+00	o3zn5uxiqix4	51394e00-f205-407f-b368-b43332d847a7
00000000-0000-0000-0000-000000000000	48	pzc7eiiqc2gu	cca4138d-4349-477f-83d3-1f96687e3f66	t	2025-10-07 04:29:47.475421+00	2025-10-07 05:48:45.429533+00	kzzcu2hoxudx	51394e00-f205-407f-b368-b43332d847a7
00000000-0000-0000-0000-000000000000	49	u5li3qlxb3zt	cca4138d-4349-477f-83d3-1f96687e3f66	f	2025-10-07 05:48:45.452866+00	2025-10-07 05:48:45.452866+00	pzc7eiiqc2gu	51394e00-f205-407f-b368-b43332d847a7
00000000-0000-0000-0000-000000000000	50	r2d4ywdsriz7	cca4138d-4349-477f-83d3-1f96687e3f66	f	2025-10-07 05:49:00.224867+00	2025-10-07 05:49:00.224867+00	\N	554a9356-8846-4448-9170-eb049857e630
00000000-0000-0000-0000-000000000000	97	v3lipnebusvu	e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	f	2025-12-18 07:31:26.322206+00	2025-12-18 07:31:26.322206+00	\N	c7f195a8-1fec-4016-9117-81e9fec0383a
00000000-0000-0000-0000-000000000000	98	qexrnfgenlkv	e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	f	2025-12-18 07:32:02.712223+00	2025-12-18 07:32:02.712223+00	\N	d59bf6fd-e02c-4899-b502-38f1c6c3246b
00000000-0000-0000-0000-000000000000	99	kce2wgyk4vhi	ddee15b8-b3ef-4dbc-9015-cc34ccb013a4	f	2025-12-18 12:45:13.383774+00	2025-12-18 12:45:13.383774+00	\N	5a2d4697-720a-4941-9d9d-9223fcce381e
00000000-0000-0000-0000-000000000000	100	g44ogfrgcytx	236816a9-de5f-4b3c-980e-e9532b152910	f	2026-02-02 16:46:57.971784+00	2026-02-02 16:46:57.971784+00	\N	a2b233c0-9243-4316-8480-7aebac7c9d73
00000000-0000-0000-0000-000000000000	56	lwmjbk422bdl	cca4138d-4349-477f-83d3-1f96687e3f66	f	2025-10-07 06:04:06.838348+00	2025-10-07 06:04:06.838348+00	\N	7d72c948-fac7-452c-9a5c-4554122af823
00000000-0000-0000-0000-000000000000	101	d434z4s6w2xz	236816a9-de5f-4b3c-980e-e9532b152910	f	2026-02-02 16:47:56.979318+00	2026-02-02 16:47:56.979318+00	\N	07c0d95d-aa25-4af4-825f-1a5f7190fe4f
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: specials; Type: TABLE DATA; Schema: nagervoild; Owner: -
--

COPY nagervoild.specials (id, product_name, price, description, image_url, product_url) FROM stdin;
1	Special Nagercoil Banana Chips Combo	Rs.299.00 Rs.150	Get the authentic taste of Nagercoil in every bite with this delicious combo! 250g Crispy Banana Chips – Thinly sliced, perfectly fried, and lightly salted for that irresistible crunch. 100g Traditional Mixture – A spicy, crunchy South Indian snack blend made with care and packed with flavor.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/compo.jpg	\N
2	Maravallikilanku Chips	Rs.500.00 Rs.499	Maravallikilanku Chips are a traditional South Indian snack made from tapioca roots (cassava), locally called Maravalli Kilangu in Tamil.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/MaravallikilankuChips.jpg	\N
3	Jackfruit Chips	Rs.400.00 Rs.399	Nagercoil Jackfruit Chips are a traditional and much-loved snack from the southern tip of Tamil Nadu, especially famous in the Kanyakumari region.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/JackfruitChips.jpg	\N
4	Nenthiram Chips	Rs.300.00 Rs.299	Nenthiram Chips - the best snack you can get from South India! Made with the freshest Nagercoil Nendran Bananas, these chips are flavoured with Black pepper from Kanyakumari for an extra kick. With 4 delicious flavours to choose from – Original, Extra Spicy, Classic Salt, and Peri Peri – you can get your snack fix without compromising on flavour.	https://www.nagercoilfoods.com/images/Products/chips.png	\N
5	Nagercoil Banana Chips	Rs.200.00 Rs.170	Nagercoil Banana Chips - the best snack you can get from South India! Made with the freshest Nagercoil Nendran Bananas, these chips are flavoured with Black pepper from Kanyakumari for an extra kick. With 4 delicious flavours to choose from – Original, Extra Spicy, Classic Salt, and Peri Peri – you can get your snack fix without compromising on flavour. Get your hands on a bag of Spicy Banana Chips today and experience the unique taste of Nagercoil!	https://www.nagercoilfoods.com/images/Products/chips.png	\N
6	Nagercoil Special Karasev	Rs.150.00 Rs.121	Buy authentic Nagercoil-style Karasev – a crisp and flavourful South Indian snack made with rice flour and gram flour. Perfect for tea-time and festive celebrations!	https://www.nagercoilfoods.com/images/Products/karacho.png	\N
7	Nagercoil Special Mixture	Rs.170.00 Rs.140	Enjoy the taste of authentic South Indian Mixture – a crunchy and spicy snack mix from Kanyakumari made with boondi, peanuts, sev, and a bold blend of spices. Perfect for tea time and festivals.	https://www.nagercoilfoods.com/images/Products/mixture.png	\N
8	Nagercoil Special Seeval	Rs.150.00 Rs.120	Enjoy the crispy and spicy taste of authentic Kanyakumari-style Ribbon murukku. Made with fresh ingredients and traditional recipes, this South Indian snack is perfect for festivals or tea-time cravings. Order online and experience the flavor of Tamil Nadu!	https://www.nagercoilfoods.com/images/Products/seeval.png	\N
9	Special Nagercoil Banana Chips Combo	Rs.299.00 Rs.150	Get the authentic taste of Nagercoil in every bite with this delicious combo! 250g Crispy Banana Chips – Thinly sliced, perfectly fried, and lightly salted for that irresistible crunch. 100g Traditional Mixture – A spicy, crunchy South Indian snack blend made with care and packed with flavor.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/compo.jpg	\N
10	Maravallikilanku Chips	Rs.500.00 Rs.499	Maravallikilanku Chips are a traditional South Indian snack made from tapioca roots (cassava), locally called Maravalli Kilangu in Tamil.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/MaravallikilankuChips.jpg	\N
11	Jackfruit Chips	Rs.400.00 Rs.399	Nagercoil Jackfruit Chips are a traditional and much-loved snack from the southern tip of Tamil Nadu, especially famous in the Kanyakumari region.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/JackfruitChips.jpg	\N
12	Nenthiram Chips	Rs.300.00 Rs.299	Nenthiram Chips - the best snack you can get from South India! Made with the freshest Nagercoil Nendran Bananas, these chips are flavoured with Black pepper from Kanyakumari for an extra kick. With 4 delicious flavours to choose from – Original, Extra Spicy, Classic Salt, and Peri Peri – you can get your snack fix without compromising on flavour.	https://www.nagercoilfoods.com/images/Products/chips.png	\N
13	Nagercoil Banana Chips	Rs.200.00 Rs.170	Nagercoil Banana Chips - the best snack you can get from South India! Made with the freshest Nagercoil Nendran Bananas, these chips are flavoured with Black pepper from Kanyakumari for an extra kick. With 4 delicious flavours to choose from – Original, Extra Spicy, Classic Salt, and Peri Peri – you can get your snack fix without compromising on flavour. Get your hands on a bag of Spicy Banana Chips today and experience the unique taste of Nagercoil!	https://www.nagercoilfoods.com/images/Products/chips.png	\N
14	Nagercoil Special Karasev	Rs.150.00 Rs.121	Buy authentic Nagercoil-style Karasev – a crisp and flavourful South Indian snack made with rice flour and gram flour. Perfect for tea-time and festive celebrations!	https://www.nagercoilfoods.com/images/Products/karacho.png	\N
15	Nagercoil Special Mixture	Rs.170.00 Rs.140	Enjoy the taste of authentic South Indian Mixture – a crunchy and spicy snack mix from Kanyakumari made with boondi, peanuts, sev, and a bold blend of spices. Perfect for tea time and festivals.	https://www.nagercoilfoods.com/images/Products/mixture.png	\N
16	Nagercoil Special Seeval	Rs.150.00 Rs.120	Enjoy the crispy and spicy taste of authentic Kanyakumari-style Ribbon murukku. Made with fresh ingredients and traditional recipes, this South Indian snack is perfect for festivals or tea-time cravings. Order online and experience the flavor of Tamil Nadu!	https://www.nagercoilfoods.com/images/Products/seeval.png	\N
17	Special Nagercoil Banana Chips Combo	Rs.299.00 Rs.150	Get the authentic taste of Nagercoil in every bite with this delicious combo! 250g Crispy Banana Chips – Thinly sliced, perfectly fried, and lightly salted for that irresistible crunch. 100g Traditional Mixture – A spicy, crunchy South Indian snack blend made with care and packed with flavor.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/compo.jpg	\N
18	Maravallikilanku Chips	Rs.500.00 Rs.499	Maravallikilanku Chips are a traditional South Indian snack made from tapioca roots (cassava), locally called Maravalli Kilangu in Tamil.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/MaravallikilankuChips.jpg	\N
19	Jackfruit Chips	Rs.400.00 Rs.399	Nagercoil Jackfruit Chips are a traditional and much-loved snack from the southern tip of Tamil Nadu, especially famous in the Kanyakumari region.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/JackfruitChips.jpg	\N
20	Nenthiram Chips	Rs.300.00 Rs.299	Nenthiram Chips - the best snack you can get from South India! Made with the freshest Nagercoil Nendran Bananas, these chips are flavoured with Black pepper from Kanyakumari for an extra kick. With 4 delicious flavours to choose from – Original, Extra Spicy, Classic Salt, and Peri Peri – you can get your snack fix without compromising on flavour.	https://www.nagercoilfoods.com/images/Products/chips.png	\N
21	Nagercoil Banana Chips	Rs.200.00 Rs.170	Nagercoil Banana Chips - the best snack you can get from South India! Made with the freshest Nagercoil Nendran Bananas, these chips are flavoured with Black pepper from Kanyakumari for an extra kick. With 4 delicious flavours to choose from – Original, Extra Spicy, Classic Salt, and Peri Peri – you can get your snack fix without compromising on flavour. Get your hands on a bag of Spicy Banana Chips today and experience the unique taste of Nagercoil!	https://www.nagercoilfoods.com/images/Products/chips.png	\N
22	Nagercoil Special Karasev	Rs.150.00 Rs.121	Buy authentic Nagercoil-style Karasev – a crisp and flavourful South Indian snack made with rice flour and gram flour. Perfect for tea-time and festive celebrations!	https://www.nagercoilfoods.com/images/Products/karacho.png	\N
23	Nagercoil Special Mixture	Rs.170.00 Rs.140	Enjoy the taste of authentic South Indian Mixture – a crunchy and spicy snack mix from Kanyakumari made with boondi, peanuts, sev, and a bold blend of spices. Perfect for tea time and festivals.	https://www.nagercoilfoods.com/images/Products/mixture.png	\N
24	Nagercoil Special Seeval	Rs.150.00 Rs.120	Enjoy the crispy and spicy taste of authentic Kanyakumari-style Ribbon murukku. Made with fresh ingredients and traditional recipes, this South Indian snack is perfect for festivals or tea-time cravings. Order online and experience the flavor of Tamil Nadu!	https://www.nagercoilfoods.com/images/Products/seeval.png	\N
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.addresses (id, user_id, label, address, city, state, pin, phone, is_default, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.articles (id, user_id, url, title, summary, created_at) FROM stdin;
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profiles (id, user_id, first_name, last_name, phone, roles, created_at, updated_at, email, is_admin, is_active, last_login_at, profile_picture) FROM stdin;
71cba58d-54ae-4188-8af1-92f92ec6b775	cb26c571-6e94-4583-ab5c-a49a35f7d95e	\N	\N	\N	{customer}	2025-10-04 08:07:01.881822+00	2025-10-04 08:07:01.881822+00	\N	f	t	\N	\N
6de378e6-8943-408a-aabb-0d7473015e72	cca4138d-4349-477f-83d3-1f96687e3f66	\N	\N	\N	{customer}	2025-10-04 08:12:05.180526+00	2025-10-04 08:12:05.180526+00	\N	f	t	\N	\N
a8592244-aca4-42da-a3a8-3c6cb17b0374	481f7408-e9d6-4a4e-b3f5-85268235a47e	\N	\N	\N	{customer}	2025-10-04 16:47:17.355997+00	2025-10-04 16:47:17.355997+00	\N	f	t	\N	\N
481f7408-e9d6-4a4e-b3f5-85268235a47e	481f7408-e9d6-4a4e-b3f5-85268235a47e	Test	User	\N	{customer}	2025-10-04 16:47:18.720717+00	2025-10-07 03:53:28.64046+00	testuser@gmail.com	f	t	\N	\N
cb26c571-6e94-4583-ab5c-a49a35f7d95e	cb26c571-6e94-4583-ab5c-a49a35f7d95e	marry	john	\N	{customer}	2025-10-04 08:07:02.907858+00	2025-10-07 03:53:28.64046+00	filike@denipl.net	f	t	\N	\N
cca4138d-4349-477f-83d3-1f96687e3f66	cca4138d-4349-477f-83d3-1f96687e3f66	john	pumas	\N	{customer}	2025-10-04 08:12:06.047602+00	2025-10-07 04:36:15.159908+00	xopoda@denipl.com	t	t	\N	\N
5e078e30-5f6b-446c-800f-046f04bb1e92	5e078e30-5f6b-446c-800f-046f04bb1e92	Admin	User	\N	{customer}	2025-10-07 04:38:33.583508+00	2025-10-07 04:38:33.583508+00	gofoje2419@etenx.com	t	t	\N	\N
57583c2e-4277-4ff8-a4db-2359346eae4c	57583c2e-4277-4ff8-a4db-2359346eae4c	Admin	User	9999999999	{admin,customer}	2025-10-03 05:55:49.20803+00	2025-10-07 06:01:24.383549+00	viewdodload@gmail.com	t	t	\N	\N
65567bd1-b1ff-4a54-9060-357973a502a1	65567bd1-b1ff-4a54-9060-357973a502a1	Shankara Perumal	Arunachalam	\N	{customer}	2025-10-31 12:21:36.601004+00	2025-10-31 12:21:36.601004+00	\N	f	t	\N	\N
1594ca26-055b-48c6-a60b-1b65cbf54a87	1594ca26-055b-48c6-a60b-1b65cbf54a87	Pravin	Kumar	\N	{customer}	2025-12-18 06:16:22.306737+00	2025-12-18 06:16:22.306737+00	\N	f	t	\N	\N
e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	e8fac4bd-4c34-4ee6-94ed-58d706ce05f5	some	one	\N	{customer}	2025-12-18 07:25:50.655489+00	2025-12-18 07:25:50.655489+00	\N	f	t	\N	\N
ddee15b8-b3ef-4dbc-9015-cc34ccb013a4	ddee15b8-b3ef-4dbc-9015-cc34ccb013a4	Naren	Lingam	\N	{customer}	2025-12-18 12:45:14.259129+00	2025-12-18 12:45:14.259129+00	\N	f	t	\N	\N
236816a9-de5f-4b3c-980e-e9532b152910	236816a9-de5f-4b3c-980e-e9532b152910	Akelesh	AP	\N	{customer}	2026-02-02 16:46:58.427393+00	2026-02-02 16:46:58.427393+00	\N	f	t	\N	\N
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.audit_logs (id, admin_id, entity_type, entity_id, action, payload, ip_address, user_agent, created_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, product_name, description, price, image_url, product_url, slug, sku, currency, status, created_at, updated_at) FROM stdin;
0b0b4fee-df7a-425d-b3f4-0569fac6ac92	Special Nagercoil Banana Chips Combo	Combo pack of banana chips & mixture	₹150	https://nagercoilfoods.com/images/Products/chips.png\r\n	/product/1	banana-chips-combo	SKU001	INR	active	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00
d075638d-4607-4e55-bd40-d73fe26379b2	Jackfruit Chips	Nagercoil Jackfruit Chips	₹399	https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiB-RxdqCrooxl07JmejgeOcK_kpOuRBU2ZI5iTiHtFCafuptfX3aBsMUkzRi_CXofWmH3wX72kaKsZv26gM50_ZznrX5vU8bKmXwbw3os0ExBegx8M-oKnaY-UBMD-9siPXFzx_CZLNhz7/s2048/chips.jpg	/product/3	jackfruit-chips	SKU003	INR	active	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00
7ba55c27-7728-43db-a184-54a7fab6d55f	Maravallikilanku Chips	Traditional tapioca chips	₹499	https://eangadi.in/image/cache/catalog/Seller_14/eangadi-Nuts-and-Chips-kutchi-chips-350x350.jpg	/product/2	maravallikilanku-chips	SKU002	INR	active	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00
\.


--
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_variants (id, product_id, name, sku, price, msrp, weight_grams, inventory_qty, created_at, updated_at, low_stock_threshold) FROM stdin;
5c3ad76e-c920-43db-ae83-91000f7b3b9f	0b0b4fee-df7a-425d-b3f4-0569fac6ac92	350g Combo	SKU001-350	150	\N	350	20	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00	5
51179d6e-4a1f-4059-93cf-ccdcb4505b4c	7ba55c27-7728-43db-a184-54a7fab6d55f	500g Pack	SKU002-500	499	\N	500	15	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00	5
ba6f84a7-1651-42a9-af27-651144557c67	d075638d-4607-4e55-bd40-d73fe26379b2	500g Pack	SKU003-500	399	\N	500	10	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00	5
\.


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cart_items (id, user_id, product_id, variant_id, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts (id, user_id, items, subtotal, shipping, discount, total, updated_at) FROM stdin;
43adcf1c-1fa1-4509-a4b0-e5d25da1da23	cca4138d-4349-477f-83d3-1f96687e3f66	[{"id": "8uy4lcnig", "url": "#", "name": "Kovilpatti Kadalai Mittai - Jar", "image": "https://mirchi.com/os/cdn/content/images/kovilpatti%20kadalai%20mittai%20jar%20bharath%20snacks_tile_0188412.webp", "price": 134, "quantity": 1, "description": "Traditional groundnut chikki made in Kovilpatti, Madurai. Perfect for festivals and gifting."}]	134.00	60.00	0.00	194.00	2025-10-07 04:41:50.377+00
a76b3cd6-ee28-4a55-95aa-f894f0185f7d	6de378e6-8943-408a-aabb-0d7473015e72	[{"id": "8uy4lcnig", "url": "#", "name": "Kovilpatti Kadalai Mittai - Jar", "image": "https://mirchi.com/os/cdn/content/images/kovilpatti%20kadalai%20mittai%20jar%20bharath%20snacks_tile_0188412.webp", "price": 134, "quantity": 1, "description": "Traditional groundnut chikki made in Kovilpatti, Madurai. Perfect for festivals and gifting."}]	134.00	60.00	0.00	194.00	2025-10-07 05:48:48.839+00
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collections (id, name, slug, description, image, created_at, updated_at) FROM stdin;
5c20d1c9-8eae-49cf-b31f-2f1b20fd88d1	Banana Chips	banana-chips	Collection of banana chips	https://dummyimage.com/400x400/111/fff	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00
83c9c993-fe2b-4c63-b53e-c3f0d3ec57fc	Tapioca Chips	tapioca-chips	Collection of tapioca chips	https://dummyimage.com/400x400/222/fff	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00
6ec1381e-447b-4904-9c5e-6a690085837e	Jackfruit Chips	jackfruit-chips	Collection of jackfruit chips	https://dummyimage.com/400x400/333/fff	2025-10-03 05:55:49.20803+00	2025-10-03 05:55:49.20803+00
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.coupons (id, code, type, value, usage_limit, used_count, starts_at, expires_at, metadata) FROM stdin;
\.


--
-- Data for Name: ooru_specials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ooru_specials (id, category_name, slug, description, image, created_at, updated_at) FROM stdin;
c2e1d40c-51ac-459a-a176-cc70674a331f	Tirunelveli Specials	tirunelveli-specials	Specialties from Tirunelveli, prepared using traditional methods and authentic ingredients.	https://i.postimg.cc/T3Hk9T5Z/1650f394-ab90-422f-a4bf-a0c5c396dcb5.jpg	2025-10-03 06:46:30.722841+00	2025-10-03 06:46:30.722841+00
3c26beab-35d1-4d05-8e5a-8417c498a9cd	Nagercoil Specials	nagercoil-specials	Exclusive specialties from Nagercoil, crafted with local ingredients and traditional methods.	https://i.postimg.cc/MHTMdJB2/a47ed797-a6f1-45d3-b74e-4ff1404e1608.jpg	2025-10-03 06:46:30.722841+00	2025-10-03 06:46:30.722841+00
2e04a6d2-1972-43ff-aecf-51d825bd9d87	Madurai Specials	madurai-specials	Authentic Madurai delicacies prepared using time-honored recipes and local ingredients.	https://i.postimg.cc/4y9ZJ8k1/48c12e74-35f8-4da4-b1af-af495e91b4d2.jpg	2025-10-03 06:46:30.722841+00	2025-10-03 06:46:30.722841+00
\.


--
-- Data for Name: ooru_specials_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ooru_specials_products (id, ooru_special_id, product_name, weight, price, discounted_price, description, image_url, created_at, updated_at) FROM stdin;
5d0fb570-5458-461e-815c-8f4593824092	3c26beab-35d1-4d05-8e5a-8417c498a9cd	Special Nagercoil Banana Chips Combo	350g	Rs.299.00	Rs.150	Get the authentic taste of Nagercoil in every bite with this delicious combo!, 250g Crispy Banana Chips – Thinly sliced, perfectly fried, and lightly salted for that irresistible crunch. 100g Traditional Mixture – A spicy, crunchy South Indian snack blend made with care and packed with flavor.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/compo.jpg	2025-10-03 06:56:40.197729+00	2025-10-03 06:56:40.197729+00
7009af76-2711-4400-81c1-c665e113776e	3c26beab-35d1-4d05-8e5a-8417c498a9cd	Maravallikilanku Chips	500g	Rs.500.00	Rs.499	Maravallikilanku Chips are a traditional South Indian snack made from tapioca roots (cassava), locally called Maravalli Kilangu in Tamil.	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/MaravallikilankuChips.jpg	2025-10-03 06:56:40.197729+00	2025-10-03 06:56:40.197729+00
558f0e2a-5d63-4f54-81a7-d69bf8542904	3c26beab-35d1-4d05-8e5a-8417c498a9cd	Jackfruit Chips	500g	Rs.400.00	Rs.399	Nagercoil Jackfruit Chips are a traditional and much-loved snack from the southern tip of Tamil Nadu, especially famous in the Kanyakumari region	https://wheat-coyote-359937.hostingersite.com/media/NilaaFoods/JackfruitChips.jpg	2025-10-03 06:56:40.197729+00	2025-10-03 06:56:40.197729+00
ff09e425-1d1d-40ce-983a-3aa6a55a315a	3c26beab-35d1-4d05-8e5a-8417c498a9cd	Nenthiram Chips	500g	Rs.300.00	Rs.299	Nenthiram Chips - the best snack you can get from South India ! Made with the freshest Nagercoil Nendran Bananas, these chips are flavoured with Black pepper from Kanyakumari for an extra kick. With 4 delicious flavours to choose from – Original, Extra Spicy, Classic Salt, and Peri Peri – you can get your snack fix without compromising on flavour hands on a bag of Spicy Banana Chips today and experience the unique taste of Nager	https://www.nagercoilfoods.com/images/Products/chips.png	2025-10-03 06:56:40.197729+00	2025-10-03 06:56:40.197729+00
f1633cd4-cf23-4e40-9792-991f685c336c	3c26beab-35d1-4d05-8e5a-8417c498a9cd	Nagercoil Banana Chips	250g	Rs.200.00	Rs.170	Nagercoil Banana Chips - the best snack you can get from South India ! Made with the freshest Nagercoil Nendran Bananas, these chips are flavoured with Black pepper from Kanyakumari for an extra kick. With 4 delicious flavours to choose from – Original, Extra Spicy, Classic Salt, and Peri Peri – you can get your snack fix without compromising on flavour. Get your hands on a bag of Spicy Banana Chips today and experience the unique taste of Nagercoil!	https://www.nagercoilfoods.com/images/Products/chips.png	2025-10-03 06:56:40.197729+00	2025-10-03 06:56:40.197729+00
0826dfec-0593-49e5-8e32-1b687fa67593	3c26beab-35d1-4d05-8e5a-8417c498a9cd	Nagercoil Special Karasev	250g	Rs.150.00	Rs.121	Buy authentic Nagercoil-style Karasev – a crisp and flavourful South Indian snack made with rice flour and gram flour. Perfect for tea-time and festive celebrations!	https://www.nagercoilfoods.com/images/Products/karacho.png	2025-10-03 06:56:40.197729+00	2025-10-03 06:56:40.197729+00
ea4932fe-7efd-4c05-a49b-7c9beee50356	3c26beab-35d1-4d05-8e5a-8417c498a9cd	Nagercoil Special Mixture	250g	Rs.170.00	Rs.140	Enjoy the taste of authentic South Indian Mixture – a crunchy and spicy snack mix from Kanyakumari made with boondi, peanuts, sev, and a bold blend of spices. Perfect for tea time and festivals	https://www.nagercoilfoods.com/images/Products/mixture.png	2025-10-03 06:56:40.197729+00	2025-10-03 06:56:40.197729+00
03293681-1338-4f95-a6c2-7103ef50d0ee	3c26beab-35d1-4d05-8e5a-8417c498a9cd	Nagercoil Special Seeval	250g	Rs.150.00	Rs.120	Enjoy the crispy and spicy taste of authentic Kanyakumari-style Ribbon murukku . Made with fresh ingredients and traditional recipes, this South Indian snack is perfect for festivals or tea-time cravings. Order online and experience the flavor of Tamil Nadu!	https://www.nagercoilfoods.com/images/Products/seeval.png	2025-10-03 06:56:40.197729+00	2025-10-03 06:56:40.197729+00
1484ad8c-3818-4dfe-8fa3-92793542d000	c2e1d40c-51ac-459a-a176-cc70674a331f	Original Srivilliputhur Palkova 125g	125g	Rs.99.00	Rs.99.00	Delicious and traditional Srivilliputhur Palkova, made with pure milk and sugar. Soft, melt-in-your-mouth texture.	https://www.indiansnackhouse.com/cdn/shop/files/Screen_Shot_2025-04-07_at_10.42.04_AM.png?v=1744002768&width=533	2025-10-03 07:33:03.943376+00	2025-10-03 07:33:03.943376+00
05b53a32-0bfd-41df-b9ec-015e63a30395	c2e1d40c-51ac-459a-a176-cc70674a331f	Tirunelveli Ghee Alwa 125g	125g	Rs.99.00	Rs.99.00	Authentic Tirunelveli Ghee Alwa made with traditional methods, rich in ghee and perfect for festive occasions.	https://www.indiansnackhouse.com/cdn/shop/files/Screen_Shot_2025-04-07_at_10.43.22_AM.png?v=1744002857&width=533	2025-10-03 07:33:03.943376+00	2025-10-03 07:33:03.943376+00
a1aac874-84c8-4358-b445-b2b3f700dace	c2e1d40c-51ac-459a-a176-cc70674a331f	Kovilpatti Kadalai Mittai 125g (Groundnut Chikki)	125g	Rs.59.00	Rs.59.00	Crunchy groundnut chikki from Kovilpatti, made with roasted peanuts and jaggery. A classic South Indian sweet snack.	https://www.indiansnackhouse.com/cdn/shop/files/kadalaimittai-DP-1_copy.png?v=1721112330&width=533	2025-10-03 07:33:03.943376+00	2025-10-03 07:33:03.943376+00
eb14a5be-d166-406c-84d1-5dea23d9dbeb	c2e1d40c-51ac-459a-a176-cc70674a331f	Srirangam Adhirasam 125g	125g	Rs.78.00	Rs.78.00	Traditional Srirangam Adhirasam, deep-fried jaggery donuts made from rice flour, soft and flavorful.	https://www.indiansnackhouse.com/cdn/shop/files/1200_x_1800-13_1.jpg?v=1745660538&width=533	2025-10-03 07:33:03.943376+00	2025-10-03 07:33:03.943376+00
1449f6fa-a846-4ae5-8a9d-fa1cb7d02d78	c2e1d40c-51ac-459a-a176-cc70674a331f	Tuticorin (Thoothukudi) Cashew Macaroons	125g	Rs.99.00	Rs.99.00	Soft and rich cashew macaroons from Tuticorin, perfect for gifting or tea-time indulgence.	https://www.indiansnackhouse.com/cdn/shop/files/Thoothukudi-Macroon_copy_b8a35ef9-e2fc-47af-85fe-04b522870cdc.png?v=1745758778&width=533	2025-10-03 07:33:03.943376+00	2025-10-03 07:33:03.943376+00
03a44d40-e765-46be-90da-6f078fd0b21f	c2e1d40c-51ac-459a-a176-cc70674a331f	Kerala Sarkara Nendran Banana Upperi 100g	100g	Rs.80.00	Rs.80.00	Sweet and crispy banana upperi made from Kerala Nendran bananas, coated with jaggery for a natural sweetness.	https://www.indiansnackhouse.com/cdn/shop/files/upperi-1.jpg?v=1733325748&width=533	2025-10-03 07:33:03.943376+00	2025-10-03 07:33:03.943376+00
e7fc1b91-468a-42ba-9189-d93672013ef1	2e04a6d2-1972-43ff-aecf-51d825bd9d87	Kovilpatti Kadalai Mittai - Jar	300g	₹141.00	₹134.00	Traditional groundnut chikki made in Kovilpatti, Madurai. Perfect for festivals and gifting.	https://mirchi.com/os/cdn/content/images/kovilpatti%20kadalai%20mittai%20jar%20bharath%20snacks_tile_0188412.webp	2025-10-03 07:59:36.643318+00	2025-10-03 07:59:36.643318+00
2cd75c89-116a-4935-9a89-4afc1097fa19	2e04a6d2-1972-43ff-aecf-51d825bd9d87	Coconut Laddu (Pack of 2)	200g	₹146.00	₹139.00	Soft and sweet coconut laddus made with pure coconut and jaggery. Pack of 2 for sharing.	https://mirchi.com/os/cdn/content/images/coconut%20laddu%20pack%20of%202%20bharath%20snacks_tile_0158230.webp	2025-10-03 07:59:36.643318+00	2025-10-03 07:59:36.643318+00
40ea8f60-b0e9-4af3-b9d7-fe39a2eb41bd	2e04a6d2-1972-43ff-aecf-51d825bd9d87	Till Rounds (Pack of 2)	250g	₹146.00	₹139.00	Crunchy sesame seed rounds with a perfect balance of sweetness. Traditional Madurai snack.	https://mirchi.com/os/cdn/content/images/till%20rounds%20pack%20of%202%20bharath%20snacks_tile_0585570.webp	2025-10-03 07:59:36.643318+00	2025-10-03 07:59:36.643318+00
f7c33428-ccb9-4fd5-932d-fa53f3d10b15	2e04a6d2-1972-43ff-aecf-51d825bd9d87	Peanut Thokku Mittai	150g	₹103.00	₹99.00	A delicious crunchy peanut snack with a hint of sweetness. Classic Madurai treat.	https://mirchi.com/os/cdn/content/images/peanut%20thokku%20mittai%20bharath%20snacks_tile_0884518.webp	2025-10-03 07:59:36.643318+00	2025-10-03 07:59:36.643318+00
b566b095-421d-4330-973f-cd3b7f08e3c7	2e04a6d2-1972-43ff-aecf-51d825bd9d87	Super Pack Nice Chikki (Pack of 2)	300g	₹146.00	₹139.00	Soft and crunchy groundnut chikki packed for sharing. Perfect for tea time.	https://mirchi.com/os/cdn/content/images/super%20pack%20nice%20chikki%20pack%20of%202%20bharath%20snacks_tile_0934540.webp	2025-10-03 07:59:36.643318+00	2025-10-03 07:59:36.643318+00
f3e0efb4-7ae8-41b3-b137-47e98107c047	2e04a6d2-1972-43ff-aecf-51d825bd9d87	Super Pack Groundnut Chikki (Pack of 2)	300g	₹146.00	₹139.00	Traditional Madurai-style groundnut chikki, crunchy and sweet. Pack of 2.	https://mirchi.com/os/cdn/content/images/super%20pack%20groundnut%20chikki%20pack%20of%202%20bharath%20snacks_tile_0637188.webp	2025-10-03 07:59:36.643318+00	2025-10-03 07:59:36.643318+00
68d80c28-98cd-4b7f-a0f3-87f7f71f1dd7	2e04a6d2-1972-43ff-aecf-51d825bd9d87	Kamarkat (Pack of 2)	300g	₹146.00	₹139.00	Crispy peanut chikki with a bold crunch. Pack of 2, perfect for festivals.	https://mirchi.com/os/cdn/content/images/kamarkat%20pack%20of%202%20bharath%20snacks_tile_0564647.webp	2025-10-03 07:59:36.643318+00	2025-10-03 07:59:36.643318+00
ec49a966-949f-4bef-b7a1-ad30b5770aae	2e04a6d2-1972-43ff-aecf-51d825bd9d87	Nice Chikki Rounds (Pack of 2)	300g	₹146.00	₹139.00	Round-shaped crunchy peanut chikki, delicious and perfect for gifting. Pack of 2.	https://mirchi.com/os/cdn/content/images/nice%20chikki%20rounds%20bharath%20snacks_tile_0907683.webp	2025-10-03 07:59:36.643318+00	2025-10-03 07:59:36.643318+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, user_id, order_number, status, total_amount, subtotal, shipping_amount, discount_amount, shipping_address, payment_status, payment_method, special_instructions, created_at, updated_at, admin_notes, assigned_to, priority) FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_items (id, order_id, product_id, variant_id, quantity, unit_price, total_price, created_at) FROM stdin;
\.


--
-- Data for Name: product_collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_collections (product_id, collection_id) FROM stdin;
0b0b4fee-df7a-425d-b3f4-0569fac6ac92	5c20d1c9-8eae-49cf-b31f-2f1b20fd88d1
7ba55c27-7728-43db-a184-54a7fab6d55f	83c9c993-fe2b-4c63-b53e-c3f0d3ec57fc
d075638d-4607-4e55-bd40-d73fe26379b2	6ec1381e-447b-4904-9c5e-6a690085837e
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reviews (id, product_id, customer_name, review_title, review_comment, rating, created_at, updated_at, is_verified, helpful_count) FROM stdin;
823ea7c1-2ecd-412e-9ff7-0cb21d5cb72e	traditional-karasev	Sudha Krishnan	Absolutely authentic taste!	Reminds me of my grandmother's homemade chips. The traditional taste is exactly what I was looking for. Highly recommended!	5	2025-10-04 16:34:41.4216+00	2025-10-04 16:34:41.4216+00	t	0
14ed5015-c387-4768-aaae-210f7f29bcff	traditional-karasev	Ravi Kumar	Great quality and taste	The karasev is crispy and has the perfect amount of spice. Will definitely order again.	4	2025-10-04 16:34:41.4216+00	2025-10-04 16:34:41.4216+00	t	0
5d37240d-2d84-4954-a24c-7631b00a411b	traditional-karasev	Priya Sharma	Good but could be better	Taste is good but the packaging could be improved. The chips were a bit crushed.	3	2025-10-04 16:34:41.4216+00	2025-10-04 16:34:41.4216+00	f	0
7b0a43ee-d2da-4fe2-b2fb-7520de601cc6	traditional-karasev	Lakshmi Nair	Excellent product	Authentic South Indian taste. My family loved it. The quality is top-notch.	5	2025-10-04 16:34:41.4216+00	2025-10-04 16:34:41.4216+00	t	0
eef58b5a-8551-4a2a-a525-b11b0b16dcd8	butter-mixture	Meera Nair	Best snacks for family gatherings	Everyone loves the combo pack! The butter mixture is especially delicious.	5	2025-10-04 16:34:41.4216+00	2025-10-04 16:34:41.4216+00	t	0
e45bad08-e14d-4b0d-afb9-da7477bf101a	butter-mixture	Arun Kumar	Good value for money	Nice taste and good quantity. Would recommend to others.	4	2025-10-04 16:34:41.4216+00	2025-10-04 16:34:41.4216+00	t	0
cca3909a-ffe3-4119-a655-c4cd90bb0451	jackfruit-chips	Deepika V	Unique and delicious	Never had jackfruit chips before. This is amazing! Unique taste and great quality.	5	2025-10-04 16:34:41.4216+00	2025-10-04 16:34:41.4216+00	t	0
569569f0-38fc-4679-80a0-b18fd0acfeae	karupatti-laddu	Venkat Raman	Excellent packaging and delivery	The karupatti sweets are divine! Perfect sweetness and traditional taste.	5	2025-10-04 16:34:41.4216+00	2025-10-04 16:34:41.4216+00	t	0
5a2dca61-04cd-4166-b092-1ad9b92a9a3c	7	John Doe	Amazing authentic taste!	This Traditional Karasev is absolutely delicious! The authentic pepper flavor reminds me of my grandmother's homemade snacks. The quality is excellent and it arrived fresh. Highly recommended for anyone who loves authentic South Indian snacks!	5	2025-10-04 16:37:25.249088+00	2025-10-04 16:37:25.249088+00	f	0
\.


--
-- Data for Name: saved_articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.saved_articles (id, user_id, url, title, summary, created_at) FROM stdin;
\.


--
-- Data for Name: tamilnadu_karupatti_classics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tamilnadu_karupatti_classics (id, product_name, weight, price, discounted_price, description, image_url) FROM stdin;
2fd3553a-0f61-4b5c-a981-3b74b04c5139	Sattur Karupatti Mittai - சாத்தூர் கருப்பட்டி மிட்டாய்	100	270.00	250.00	This product is not eligible for one-day delivery Looking for the best Karupatti Mittai ? You’ve found it! At Pettikadai , we bring you the finest traditional jaggery sweets, made with pure palm jaggery, rice flour, and urad dal . It’s a crispy, melt-in-your-mouth treat that’s both delicious and healthy! Order Now & Enjoy the Taste of Tradition! Treat yourself to this classic South Indian sweet or gift it to your loved ones. Order Karupatti Mittai today from Pettikadai.in and experience the goodness of traditional sweets! 🎁 Perfect for festivals, celebrations, and everyday snacking! Read More	//pettikadai.in/cdn/shop/products/Karupattimittai_300x300_crop_center.jpg?v=1749048195
7d140088-e1c6-4685-92a0-d817b043f152	Sivakasi Jaggery Mittai-சிவகாசி வெல்லம் மிட்டாய்	100	210.00	200.00	This product is not eligible for one-day delivery An ideal snack for kids and adults alike, this sweet and crunchy savoury has a caramelized taste with the native earthy smell of karupatti (palm jaggery), rich in iron and zinc. Made of gram flour and rice flour, this oil fried snack is topped with palm jaggery syrup, which gives a caramelized flavour to this healthy and tasty snack. ஒரு துண்டு பனை வெல்லத்தின் சுவை ஒரு நாள் முழுதும் நாவில் இருந்திடும். சுவை மிகுந்த இப்பனைவெல்லத்தை கொண்டு சிவகாசியில் பனைவெல்லம் மிட்டாய் தயாரிக்கப்படுகிறது. கடலை மாவு, அரிசி மாவுடன் வெல்லப்பாகுவினை சேர்த்து எண்ணெயில் வறுத்து எடுக்கும்பொழுது வெளிவரும் சுவை அலாதியானது. INGREDIENTS Rice Flour, Urid Dhall, Jaggery (Vellam) Syrup SERVING GUIDE Store in an airtight container SHELF LIFE 12 Days Validity Read More	//pettikadai.in/cdn/shop/products/karupattimittai-sivakasi_300x300_crop_center.jpg?v=1749048192
ae765031-a5af-4fd2-9e61-b21a3657d8df	Palm Jaggery Sev -கருப்பட்டி சேவு	100	250.00	240.00	"Unrefined palm sugar is called Karupatti in Tamil. The batter made from rice flour and black lentil flour is dropped into hot oil in shapes like that of loops of a roller coaster track. Later these mini race tracks are dunked into caramelized sauce made of palm sugar. Though it shares a similarity with Jangir and Jalebi in shape, it is easy to differentiate it from them. The special deep flavour imparted from palm sugar and the natures of the batter are standout points that make the difference quite evident. To sweeten up your festive memories, try this!" ஒவ்வொரு புதிய சிந்தனையும் பாரம்பரியத்தை மீட்டெடுக்கிறது. கருப்பட்டியினை பயன்படுத்தி செய்யப்படும் இக்கருப்பட்டி சேவும் பாரம்பரியத்தை மீட்டெடுப்பதுடன், கருப்பட்டியின் உண்மையான சுவையையும் குழந்தைகளுக்கும், இளைய தலைமுறைக்கும் ருசியாக எடுத்து சொல்கின்றது. அரிசிமாவு, கருப்பு உளுந்து மாவினை சூடான எண்ணெயில் வறுத்து, கருப்பட்டி பாகில் கலந்து செய்யப்படும் சேவின் சுவை நாவிலேயே தங்கிவிடுகின்றது. கருப்பட்டி சேவினை சுவைத்து மகிழ இன்றே நம்ம பெட்டிக்கடையில் ஆர்டர் செய்யுங்கள். INGREDIENTS Besan Flour, Rice flour, Palm jaggery syrup, Dried Ginger & Groundnut oil SERVING GUIDE Store in an airtight container SHELF LIFE 30 Days Validity Read More	//pettikadai.in/cdn/shop/products/karupattisev_300x300_crop_center.jpg?v=1749048198
e902582a-98d4-421c-b030-1064177a0eb3	Palm Jaggery Kaju Katli - கருப்பட்டி காஜூ கத்திலி	100	560.00	550.00	This product contains Dairy items and cannot be shipped to EU and UK product is not eligible for one-day delivery DESCRIPTION Karupatti Kaju Katli are a unique take on the delightful Kaju Katli with its origins in North India. The usual white sugar is substituted with the natural Palm jaggery that has amazing health benefits and medicinal uses.  With no compromises made on taste, this is a much more interesting alternative to make your celebrations better. குழந்தைகள் விரும்பி சாப்பிடும் சாக்லெட்டுகளுக்கு சிறந்த மாற்றாகவும், ஆரோக்கியம் நிறைந்ததாகவும் கருப்பட்டியினை மூலப்பொருளாக கொண்டு காஜூ கத்திலி தயாரிக்கப்பட்டிருக்கிறது. இதன் மந்திரசுவை மீண்டும் மீண்டும் சுவைக்கும் ஆர்வத்தினை ஏற்படுத்துகிறது. நீங்களும் சுவைத்து மகிழ நம்ம பெட்டிக்கடையில் இன்றே ஆர்டர் செய்யுங்கள். INGREDIENTS Cashew, Palm Jaggery, Ghee SERVING GUIDE Store in an airtight container SHELF LIFE 12 days Read More	//pettikadai.in/cdn/shop/products/kajukathalai_300x300_crop_center.jpg?v=1672645601
\.


--
-- Data for Name: tamilnadu_savoury_classics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tamilnadu_savoury_classics (id, product_name, weight, price, discounted_price, description, image_url) FROM stdin;
2c0409fd-5026-4bdf-a37a-3fb8000d837d	Butter Seedai	100	46.00	32.00	Popular during Krishna Jayanthi festivities, these crispy savory roundels made with an extra dollop of butter are perfect for a quick munch. Lord Krishna loves his Butter seedai’s, how about you? Shelf Life: 25 days Ingredients: Rice Flour. Salt, Sesame, Butter	https://thesattursnacks.com/wp-content/uploads/2020/12/4.BUTTER-SEEDAI-1KG-340.jpg
30ce23fc-e4f8-4a4c-946d-f9422dcf2105	Pepper Thattai	100	32.00	32.00	Spice lovers, gear up . Milagu Thattai is a delicious savory snack made from rice flour. The magic ingredient here is pepper.Taste our pepper thattai to know what I’m talking about. Shelf Life: 25 days Ingredients: Rice Flour, Urad Dal Flour, Pottukadali Flour, Pepper	https://thesattursnacks.com/wp-content/uploads/2021/01/MILAGU-THATTAI.jpg
47a624f7-6db3-4ce3-849d-b1034a94b05c	Kaara Boondhi	100	40.00	32.00	Loved by all ages alike, Sattur snacks’ kaara boondhi is the perfect blend of gram flour, spices, ground nuts, cashew nuts and curry leaves. You can simply munch on them or have them as a side to your main dish. Goes great with curd rice too! Shelf Life: 25 days Ingredients: Besan Flour, Red Chilli Powder, Salt, Curry Leaves, Pepper	https://thesattursnacks.com/wp-content/uploads/2021/01/12.KAARA-BOONDHI-1KG-340.jpg
655698ca-aa86-4742-8f25-293d7a9d0a8c	Masala Kadalai	100	40.00	32.00	Attention, peanut lovers! We got you! Covered in a flavourful batter deep fried in oil and garnished with fresh curry leaves, our Masala Kadalai is a top choice among individuals of all age gatherings. Shelf Life : 25 days Ingredients: Groundnut, Salt, Rice Flour, Red Chilli Powder, Curry Leaves	https://thesattursnacks.com/wp-content/uploads/2021/01/MASALA-KADLAI-.jpg
6b691d75-a354-460e-b276-a014048b2ede	Classic Seeval	100	44.00	32.00	Made with gram flour, asoefoetida and a ton of other flavors, this snack offers a zesty twist in each chomp! No need for an occasion or a special time of day — you can snack on Seeval all day long! Shelf Life: 45 days Ingredients: Besan Flour, Rice Flour, Hill Garlic, Salt	https://thesattursnacks.com/wp-content/uploads/2021/01/SATTUR-SEEVAL.jpg
75e49e03-4b78-4402-ae0f-917b846c19f5	Coriander Thattai	100	32.00	32.00	A definite most loved nibble among children and grown-ups the same, thattai stays an interminable favourite! Customers rush to our shop for the unique delicacy made of coriander, keeping our shop occupied each day. Shelf Life: 25 days Ingredients: Rice Flour, Urad Dal Flour, Pottukadali Flour, Coriander	https://thesattursnacks.com/wp-content/uploads/2021/01/MALLI-THATTAI.jpg
7ba122e7-5ac5-4dbc-ba88-d038d27c9e8d	Chovi Seedai	100	42.00	32.00	Our Chovi seedai is made using maida batter kneaded with butter, manually extruded, and fried.  These charming lil’ roundels are sure to allure the eater, to eat more and more. Shelf Life: 25 days Ingredients: Maida, Salt, Sesame, Butter, Masala Powder	https://thesattursnacks.com/wp-content/uploads/2021/01/SHELL-SEEDAI.jpg
97a067e4-5b4c-4dad-9bdc-ddaa23feb9a2	Healthy Multigrain Pulses	100	46.00	32.00	Here’s a bite that can soon become a healthy addiction. Each spoonful of this snack is fueled by proteins. With the freshest ingredients Bengal Gram, Wheat, Horse Gram, Black Gram, Green Gram, White Beans, Chick Peas and exemplary Indian flavors, this spicy and extraordinary blend is a long way from your ordinary combination. Shelf Life: 25 days Ingredients: Bengal Gram, Wheat, Horse Gram, Black Gram, Green Gram, White Beans, Chick Peas	https://thesattursnacks.com/wp-content/uploads/2021/01/NAVADHANYAM.jpg
ab19d306-2875-45f1-a9da-28df8c454ffa	Plain Baby Sev	100	30.00	31.00	Tangy besan crisps that are oh, so lil’. Pop them in your mouth right away or sprinkle them over Bhel puri, Dahi puri, Bhel Puri or Samosa Chaat! Shelf Life: 45 days Ingredients: Besan Flour, Rice Flour, Hill Garlic, Asafoetida, Salt, Jeera	https://thesattursnacks.com/wp-content/uploads/2021/01/PLAIN-BABY-SEVU.jpg
bad16b9a-15c9-41dd-ae5c-2450b5aba419	Pepper Seeval	100	34.00	32.00	Made with besan and rice flour, this spicy, fried snack has the zing that could get you addicted to its taste. Adding pepper to the regular seeval elevates the snack to another level. Shelf Life : 45 days Ingredients: Besan Flour, Rice Flour, Hill Garlic, Pepper, Salt	https://thesattursnacks.com/wp-content/uploads/2021/01/MILAGU-SEEVAL.jpg
d35c86e0-8ca5-49dd-b3f8-f811c88fdc1d	Butter Sevu	100	46.00	32.00	Crispy flakes of sev packed with the lusciousness of freshly churned butter. Best eaten straight from the pack or topped over rice dishes. Shelf Life: 45 days Ingredients: Rice Flour, Salt, Sesame, Butter	https://thesattursnacks.com/wp-content/uploads/2020/12/5.BUTTER-SEVU-1KG-340.jpg
d93cb97b-63bd-4d21-9d5a-4bf53e9f267d	Pepper Sev	100	46.00	32.00	Slightly on the spicier side, these fried noodle-shaped peppery crisps are the ideal snack on a rainy day with some tea/espresso! Shelf Life: 45 days Ingredients: Besan Flour, Rice Flour, Hill Garlic, Pepper, Asafoetida, Salt, Jeera	https://thesattursnacks.com/wp-content/uploads/2021/01/MILAGU-SEVU.jpg
d99f34f5-0805-451c-96bd-563fe66d9331	Ellu Kaara Sevu	100	34.00	32.00	Spiced gram flour spiked with crunchy sesame seeds and fried to perfection. Crunch and flavour in every bite. Shelf Life: 45 days Ingredients: Rice Flour, Salt, Sesame, Chilly Powder	https://thesattursnacks.com/wp-content/uploads/2020/12/10.ELLU-KAARA-SEVU-1KG-340.jpg
fc19437d-ee1b-4662-9381-9438ee06df4c	Classic Sattur Kaara Sev	100	46.00	32.00	Sattur Snacks is very famous for its Kaara Sev. Our fiery Kaara Sev has its own flavor since we utilize Aachi’s secret recipe. Hot, fragrant and firm, this snack has stood the trial of time to rule and turn into people’s top pick. Made with gram flour (besan) and rice flour enhanced with red chillies, hill garlic, cumin and asafoetida, this oil fried snack is a true delight Shelf Life: 45 days Ingredients: Besan Flour, Rice Flour, Hill Garlic, Red Chilli Powder, Asafoetida, Salt, Jeera	https://thesattursnacks.com/wp-content/uploads/2021/01/SATTUR-KAARA-SEVU.jpg
f61d38ae-31e1-4de6-8e09-e1d8dab8d5c0	Chilly Seeval	100	44.00	32.00	A classic originating from the Sattur region, try out some lip-smacking Chilly Seeval. Nothing but a spicy take on the butter seeval. Goes great with Chai too! Shelf Life: 45 days Ingredients: Besan Flour, Rice Flour, Hill Garlic, Salt, Dried Chilli	https://thesattursnacks.com/wp-content/uploads/2020/12/7.CHILLY-SEEVAL-1KG-340.jpg
099553b3-1138-4470-b6c8-28021c367062	Spicy Thattai	100	42.00	32.00	Widely popular and loved by all, thattais are delicious deep-fried crisp crackers made with rice flour, lentil flour, spices and herbs. Try our take on this popular dish before they run out. Shelf Life: 25 days Ingredients: Rice Flour, Urad Dal Flour, Pottukadali Flour, Red Chilli Powder	https://thesattursnacks.com/wp-content/uploads/2021/01/13.KAARA-THATTAI-1KG-340.jpg
14d6a5ac-e16a-47d5-b01a-3cbf31d1cb8d	Mini Thattadai	100	36.00	32.00	Shelf Life : 28 Days Ingredients: Rice Flour, Urad Dal Flour, Butter, Red Chilli Powder, Roasted Gram Dal	https://thesattursnacks.com/wp-content/uploads/2021/10/Mini-Thattadai.jpg
24c4004b-dd78-48b7-8718-b7c7e08819eb	Pakoda	100	42.00	32.00	Shelf Life : 28 Days Ingredients: Besan Flour, Onions, Curry Leaves, Green Chilli, Salt, Cumin	https://thesattursnacks.com/wp-content/uploads/2021/09/Pakoda.jpg
4d034d4d-3328-44cd-b06d-9b0cd64aca45	Corn Mixture	100	44.00	32.00	Shelf Life : 28 Days Ingredients: Corn Flakes, Groundnuts, Roasted Gram Dal, Kashmiri Red chilli powder, Curry Leaves	https://thesattursnacks.com/wp-content/uploads/2021/10/Corn-Mixture.jpg
58a85e4a-6c36-4401-b76c-ffbf513ca234	Moto Mixture	100	44.00	32.00	Every district and province of India has its own interesting and delicious version of the mixture. This one aptly captures the vibrancy and spirit of Bombay! Shelf Life: 25 days Ingredients: Besan Flour,Wheat, Gram flour, Groundnuts, Roasted Lentils	https://thesattursnacks.com/wp-content/uploads/2021/01/MOTTO-MIXER.jpg
704991b6-76e1-4f76-b28a-99ba14d8f5d0	Pepper Mixture	100	46.00	32.00	Shelf Life : 25 days Ingredients: Besan Flour,Pepper Powder, Salt, Roasted Lentils	https://thesattursnacks.com/wp-content/uploads/2021/01/PEPPER-MIXER.jpg
c4623a8e-2b3e-4445-9860-4b3b0e885c73	Oma Podi	100	44.00	32.00	Shelf Life : 28 Days Ingredients: Besan Flour, Curry Leaves,Salt	https://thesattursnacks.com/wp-content/uploads/2021/10/Oma-Podi.jpg
c67b91ce-e5ca-4270-a907-99a1173e4085	Chit Chat Mixture	100	44.00	32.00	Shelf Life : 28 Days Ingredients: Cashew, Chat Masala, Kashmiri Red Chilli Powder, Groundnut, Flattened Rice	https://thesattursnacks.com/wp-content/uploads/2021/10/Chit-Chat-Mixture.jpg
da503281-11f0-477a-b89e-c108cd6c8afd	Ribbon Pakoda	100	46.00	32.00	The Ribbon Pakoda is a visual treat in addition to being a delicious one! Predominantly seen and made in South-Indian homes during family-oriented festivals and pujas, this snack is literally every kid’s favourite. Produced using an even blend of gram flour and rice flour with a hint of spice, pressed into equally meager strips and deep-fried in oil, the ribbon pakkoda from Sattur Snacks is a snack lover’s delight and is sure to leave a lingering taste with every bite. Shelf Life: 45 days Ingredients: Rice Flour, Red Chilli Powder, Hill Garlic, Roasted Gram Powder, Butter, Cumin	https://thesattursnacks.com/wp-content/uploads/2021/01/RIBBON-SEEVAL.jpg
e3ecc15c-518a-4b89-b75f-c48b3dfc36f0	Butter Mixture	100	46.00	32.00	What’s better than the normal mixture? Butter mixture, for sure. Feel the butter in every bite as you karuk-muruk through. Shelf Life: 25 days Ingredients: Besan Flour, Red Chilli Powder, Salt, Roasted Lentils	https://thesattursnacks.com/wp-content/uploads/2020/12/2.BOMBAY-MIXER-1KG-340.jpg
ecfca68f-4ca3-41eb-9261-c98cb2608b15	Classic Mixer	100	46.00	32.00	This irresistible classic salty and spicy snack is a flavour overload for your taste buds, aptly named ‘mixture’. Made with a mix of boondhi, crunchy omapodi (sev), peanuts, deep fried curry leaves and a whole host of other crunchy delicacies, this snack can be eaten by the handful or sprinkled atop your favourite rice dishes! Shelf Life: 25 days Ingredients: Besan Flour, Red Chilli Powder, Salt, Curry Leaves, Roasted Rice Flakes, Potato Chips	https://thesattursnacks.com/wp-content/uploads/2020/12/9.CLASSIC-MIXER-1KG-340.jpg
\.


--
-- Data for Name: tamilnadu_sweet_classics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tamilnadu_sweet_classics (id, product_name, weight, price, discounted_price, description, image_url) FROM stdin;
2665744e-1c1a-411c-81a9-5da318a28faf	Karuppatti Laddu	100	30.00	50.00	A rich palm jaggery laddoo with deep caramel tones and rustic, earthy sweetness.	https://thesattursnacks.com/wp-content/uploads/2021/01/KARUPPATTI-LADDU-300x300.jpg
3e98255f-219d-4a5a-9ffb-b0e76823be06	Paasipayar Laddu	100	46.00	50.00	A light, protein-packed green gram laddoo with a delicate roasted flavor and subtle sweetness.	https://thesattursnacks.com/wp-content/uploads/2021/01/PAASIPAYAR-LADDU-300x300.jpg
85b62a20-9f24-4e22-85a6-a411f5f3a435	Groundnut Laddu	100	44.00	50.00	A crunchy peanut laddoo bound with jaggery, offering a toasty, nutty snap and natural sweetness.	https://thesattursnacks.com/wp-content/uploads/2021/01/Ground-nut-laddu-300x300.jpg
c590c429-9b11-4166-bda5-35248faaa807	Karuppatti Halwa	100	44.00	50.00	A silky palm-jaggery halwa with dark caramel notes and slow-cooked richness.	https://thesattursnacks.com/wp-content/uploads/2021/01/karuppatti-halwa-1-300x300.jpg
1c059785-ed88-42a9-927d-47107d8fc459	Athirasam	100	46.00	50.00	A traditional rice flour–jaggery pastry, crispy at the edges and soft inside with warm sesame notes.	https://thesattursnacks.com/wp-content/uploads/2020/12/1.ADHIRASAM-1KG-340-300x300.jpg
1dfbc2bb-b1bf-484e-958a-e899f4b15807	Chota Bheem Laddu	100	46.00	50.00	A fun-sized, nutty laddoo with a soft, melt-in-mouth texture and a gentle cardamom finish.	https://thesattursnacks.com/wp-content/uploads/2020/12/8.CHOTTA-BHEEM-LADDU-1KG-360-300x300.jpg
5f0161fc-0dc1-4bbc-be90-567597354ba5	Balaji Laddu	100	46.00	50.00	A classic temple-style laddoo with roasted gram notes, ghee aroma, and festive sweetness in every bite.	https://thesattursnacks.com/wp-content/uploads/2021/01/THIRUATHI-MINI-LADDU-300x300.jpg
e0dd5c25-0d72-4da4-ac71-ea43a3808850	Munthri Kotthu	100	34.00	50.00	A crunchy cashew cluster sweet with a jaggery glaze for bite-sized bursts of nutty caramel.	https://thesattursnacks.com/wp-content/uploads/2021/01/Munthiri-Koththu-300x300.jpg
e59abe0a-a784-4dfc-a61a-ec5b4da9c383	Pottukadalai Laddu	100	34.00	50.00	A crumbly roasted gram laddoo with balanced sweetness and a fragrant ghee finish.	https://thesattursnacks.com/wp-content/uploads/2021/01/PORIKADALAI-LADDU-300x300.jpg
\.


--
-- Data for Name: messages_2026_02_01; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_02_01 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_02_02; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_02_02 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_02_03; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_02_03 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_02_04; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_02_04 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_02_05; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_02_05 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-09-28 07:25:56
20211116045059	2025-09-28 07:25:59
20211116050929	2025-09-28 07:26:01
20211116051442	2025-09-28 07:26:03
20211116212300	2025-09-28 07:26:06
20211116213355	2025-09-28 07:26:08
20211116213934	2025-09-28 07:26:10
20211116214523	2025-09-28 07:26:13
20211122062447	2025-09-28 07:26:15
20211124070109	2025-09-28 07:26:17
20211202204204	2025-09-28 07:26:19
20211202204605	2025-09-28 07:26:21
20211210212804	2025-09-28 07:26:27
20211228014915	2025-09-28 07:26:30
20220107221237	2025-09-28 07:26:32
20220228202821	2025-09-28 07:26:34
20220312004840	2025-09-28 07:26:36
20220603231003	2025-09-28 07:26:39
20220603232444	2025-09-28 07:26:41
20220615214548	2025-09-28 07:26:43
20220712093339	2025-09-28 07:26:45
20220908172859	2025-09-28 07:26:47
20220916233421	2025-09-28 07:26:50
20230119133233	2025-09-28 07:26:52
20230128025114	2025-09-28 07:26:54
20230128025212	2025-09-28 07:26:56
20230227211149	2025-09-28 07:26:59
20230228184745	2025-09-28 07:27:01
20230308225145	2025-09-28 07:27:03
20230328144023	2025-09-28 07:27:05
20231018144023	2025-09-28 07:27:07
20231204144023	2025-09-28 07:27:10
20231204144024	2025-09-28 07:27:12
20231204144025	2025-09-28 07:27:14
20240108234812	2025-09-28 07:27:17
20240109165339	2025-09-28 07:27:19
20240227174441	2025-09-28 07:27:22
20240311171622	2025-09-28 07:27:25
20240321100241	2025-09-28 07:27:30
20240401105812	2025-09-28 07:27:35
20240418121054	2025-09-28 07:27:38
20240523004032	2025-09-28 07:27:45
20240618124746	2025-09-28 07:27:47
20240801235015	2025-09-28 07:27:49
20240805133720	2025-09-28 07:27:52
20240827160934	2025-09-28 07:27:54
20240919163303	2025-09-28 07:27:56
20240919163305	2025-09-28 07:27:58
20241019105805	2025-09-28 07:28:01
20241030150047	2025-09-28 07:28:08
20241108114728	2025-09-28 07:28:11
20241121104152	2025-09-28 07:28:13
20241130184212	2025-09-28 07:28:16
20241220035512	2025-09-28 07:28:18
20241220123912	2025-09-28 07:28:20
20241224161212	2025-09-28 07:28:22
20250107150512	2025-09-28 07:28:24
20250110162412	2025-09-28 07:28:26
20250123174212	2025-09-28 07:28:28
20250128220012	2025-09-28 07:28:30
20250506224012	2025-09-28 07:28:31
20250523164012	2025-09-28 07:28:33
20250714121412	2025-09-28 07:28:35
20250905041441	2025-09-28 07:28:37
20251103001201	2025-11-19 06:13:31
20251120212548	2026-02-07 08:32:47
20251120215549	2026-02-07 08:32:47
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-09-28 07:25:53.132137
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-09-28 07:25:53.15352
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-09-28 07:25:53.160227
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-09-28 07:25:53.188539
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-09-28 07:25:53.23852
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-09-28 07:25:53.243335
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-09-28 07:25:53.248818
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-09-28 07:25:53.261492
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-09-28 07:25:53.266245
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-09-28 07:25:53.271224
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-09-28 07:25:53.277334
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-09-28 07:25:53.28274
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-09-28 07:25:53.290324
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-09-28 07:25:53.295263
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-09-28 07:25:53.300372
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-09-28 07:25:53.321366
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-09-28 07:25:53.326534
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-09-28 07:25:53.331459
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-09-28 07:25:53.336851
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-09-28 07:25:53.343613
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-09-28 07:25:53.348773
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-09-28 07:25:53.366016
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-09-28 07:25:53.386162
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-09-28 07:25:53.396473
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-09-28 07:25:53.401992
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-09-28 07:25:53.407556
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-10-02 08:45:42.458045
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-10-02 08:45:42.626344
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-10-02 08:45:42.637579
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-10-02 08:45:42.656061
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-10-02 08:45:42.819467
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-10-02 08:45:43.433593
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-10-02 08:45:43.716809
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-10-02 08:45:43.725631
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-10-02 08:45:43.7277
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-10-02 08:45:43.7347
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-10-02 08:45:43.740463
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-10-02 08:45:43.754883
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-10-02 08:45:43.761021
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-10-02 08:45:43.781571
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-10-02 08:45:43.787645
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-10-02 08:45:43.798723
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-10-02 08:45:43.805794
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-10-02 08:45:43.813122
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-11-19 06:13:32.015041
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-11-19 06:13:32.756842
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-11-19 06:13:32.847882
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-11-19 06:13:32.864558
48	iceberg-catalog-ids	2666dff93346e5d04e0a878416be1d5fec345d6f	2025-11-19 06:13:32.870397
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-01-05 12:20:05.758547
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: -
--

COPY supabase_migrations.schema_migrations (version, statements, name, created_by, idempotency_key) FROM stdin;
20250928075248	{"-- Create products table\nCREATE TABLE public.products (\n  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,\n  name TEXT NOT NULL,\n  slug TEXT NOT NULL UNIQUE,\n  description TEXT,\n  price INTEGER NOT NULL, -- in paise/cents\n  original_price INTEGER,\n  category TEXT NOT NULL,\n  image_url TEXT,\n  stock_quantity INTEGER DEFAULT 0,\n  is_active BOOLEAN DEFAULT true,\n  weight_grams INTEGER,\n  ingredients TEXT[],\n  nutritional_info JSONB,\n  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),\n  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()\n);\n\n-- Create profiles table for user data\nCREATE TABLE public.profiles (\n  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,\n  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n  first_name TEXT,\n  last_name TEXT,\n  phone TEXT,\n  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),\n  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),\n  UNIQUE(user_id)\n);\n\n-- Create orders table\nCREATE TABLE public.orders (\n  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,\n  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n  order_number TEXT NOT NULL UNIQUE,\n  status TEXT NOT NULL DEFAULT 'pending',\n  total_amount INTEGER NOT NULL, -- in paise/cents\n  subtotal INTEGER NOT NULL,\n  shipping_amount INTEGER DEFAULT 0,\n  discount_amount INTEGER DEFAULT 0,\n  coupon_code TEXT,\n  shipping_address JSONB NOT NULL,\n  payment_status TEXT DEFAULT 'pending',\n  payment_method TEXT,\n  special_instructions TEXT,\n  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),\n  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()\n);\n\n-- Create order_items table\nCREATE TABLE public.order_items (\n  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,\n  order_id UUID NOT NULL REFERENCES public.orders(id) ON DELETE CASCADE,\n  product_id UUID NOT NULL REFERENCES public.products(id) ON DELETE RESTRICT,\n  quantity INTEGER NOT NULL DEFAULT 1,\n  unit_price INTEGER NOT NULL, -- in paise/cents\n  total_price INTEGER NOT NULL, -- in paise/cents\n  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()\n);\n\n-- Create cart_items table\nCREATE TABLE public.cart_items (\n  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,\n  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n  product_id UUID NOT NULL REFERENCES public.products(id) ON DELETE CASCADE,\n  quantity INTEGER NOT NULL DEFAULT 1,\n  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),\n  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),\n  UNIQUE(user_id, product_id)\n);\n\n-- Enable RLS on all tables\nALTER TABLE public.products ENABLE ROW LEVEL SECURITY;\nALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;\nALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;\nALTER TABLE public.order_items ENABLE ROW LEVEL SECURITY;\nALTER TABLE public.cart_items ENABLE ROW LEVEL SECURITY;\n\n-- RLS Policies for products (public read access)\nCREATE POLICY \\"Products are viewable by everyone\\" \n  ON public.products FOR SELECT \n  USING (is_active = true);\n\n-- RLS Policies for profiles\nCREATE POLICY \\"Users can view their own profile\\" \n  ON public.profiles FOR SELECT \n  USING (auth.uid() = user_id);\n\nCREATE POLICY \\"Users can update their own profile\\" \n  ON public.profiles FOR UPDATE \n  USING (auth.uid() = user_id);\n\nCREATE POLICY \\"Users can insert their own profile\\" \n  ON public.profiles FOR INSERT \n  WITH CHECK (auth.uid() = user_id);\n\n-- RLS Policies for orders\nCREATE POLICY \\"Users can view their own orders\\" \n  ON public.orders FOR SELECT \n  USING (auth.uid() = user_id);\n\nCREATE POLICY \\"Users can create their own orders\\" \n  ON public.orders FOR INSERT \n  WITH CHECK (auth.uid() = user_id);\n\n-- RLS Policies for order_items\nCREATE POLICY \\"Users can view their own order items\\" \n  ON public.order_items FOR SELECT \n  USING (\n    EXISTS (\n      SELECT 1 FROM public.orders \n      WHERE orders.id = order_items.order_id \n      AND orders.user_id = auth.uid()\n    )\n  );\n\nCREATE POLICY \\"Users can create order items for their orders\\" \n  ON public.order_items FOR INSERT \n  WITH CHECK (\n    EXISTS (\n      SELECT 1 FROM public.orders \n      WHERE orders.id = order_items.order_id \n      AND orders.user_id = auth.uid()\n    )\n  );\n\n-- RLS Policies for cart_items\nCREATE POLICY \\"Users can view their own cart items\\" \n  ON public.cart_items FOR SELECT \n  USING (auth.uid() = user_id);\n\nCREATE POLICY \\"Users can insert their own cart items\\" \n  ON public.cart_items FOR INSERT \n  WITH CHECK (auth.uid() = user_id);\n\nCREATE POLICY \\"Users can update their own cart items\\" \n  ON public.cart_items FOR UPDATE \n  USING (auth.uid() = user_id);\n\nCREATE POLICY \\"Users can delete their own cart items\\" \n  ON public.cart_items FOR DELETE \n  USING (auth.uid() = user_id);\n\n-- Create function to update updated_at timestamp\nCREATE OR REPLACE FUNCTION public.update_updated_at_column()\nRETURNS TRIGGER AS $$\nBEGIN\n  NEW.updated_at = now();\n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql SET search_path = public;\n\n-- Create triggers for automatic timestamp updates\nCREATE TRIGGER update_products_updated_at\n  BEFORE UPDATE ON public.products\n  FOR EACH ROW\n  EXECUTE FUNCTION public.update_updated_at_column();\n\nCREATE TRIGGER update_profiles_updated_at\n  BEFORE UPDATE ON public.profiles\n  FOR EACH ROW\n  EXECUTE FUNCTION public.update_updated_at_column();\n\nCREATE TRIGGER update_orders_updated_at\n  BEFORE UPDATE ON public.orders\n  FOR EACH ROW\n  EXECUTE FUNCTION public.update_updated_at_column();\n\nCREATE TRIGGER update_cart_items_updated_at\n  BEFORE UPDATE ON public.cart_items\n  FOR EACH ROW\n  EXECUTE FUNCTION public.update_updated_at_column();\n\n-- Function to handle user profile creation\nCREATE OR REPLACE FUNCTION public.handle_new_user()\nRETURNS TRIGGER AS $$\nBEGIN\n  INSERT INTO public.profiles (user_id, first_name, last_name)\n  VALUES (\n    NEW.id,\n    NEW.raw_user_meta_data ->> 'first_name',\n    NEW.raw_user_meta_data ->> 'last_name'\n  );\n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;\n\n-- Trigger to create profile when user signs up\nCREATE TRIGGER on_auth_user_created\n  AFTER INSERT ON auth.users\n  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();\n\n-- Insert sample products\nINSERT INTO public.products (name, slug, description, price, original_price, category, image_url, stock_quantity, weight_grams, ingredients) VALUES\n('Nagercoil Banana Chips - Classic Salt', 'classic-banana-chips-salted', 'Authentic Nagercoil banana chips made with coconut oil and perfect salt seasoning', 18000, 20000, 'nagercoil-banana-chips', '/placeholder.svg', 50, 200, ARRAY['Banana', 'Coconut Oil', 'Salt']),\n('Enchipsu Combo Pack', 'enchipsu-combo', 'Perfect combo pack with our best selling varieties', 45000, 55000, 'best-sellers', '/placeholder.svg', 30, 500, ARRAY['Mixed Varieties']),\n('Peri Peri Masala Banana Chips', 'peri-peri-masala-banana-chips', 'Spicy peri peri flavored banana chips for spice lovers', 22000, 25000, 'coconut-oil-banana-chips', '/placeholder.svg', 40, 200, ARRAY['Banana', 'Coconut Oil', 'Peri Peri Spices']),\n('Sweet Banana Chips', 'sweet-banana-chips', 'Traditional sweet banana chips made with palm jaggery', 20000, 23000, 'nagercoil-specials', '/placeholder.svg', 35, 200, ARRAY['Banana', 'Palm Jaggery', 'Coconut Oil']),\n('Karupatti Mittai', 'karupatti-mittai', 'Traditional palm jaggery sweet from Nagercoil', 25000, 28000, 'karupatti-snacks', '/placeholder.svg', 25, 250, ARRAY['Palm Jaggery', 'Coconut', 'Cardamom']),\n('Thenkuzhal Murukku', 'thenkuzhal-murukku', 'Crispy traditional murukku made with rice flour', 18000, 20000, 'nagercoil-specials', '/placeholder.svg', 45, 200, ARRAY['Rice Flour', 'Urad Dal', 'Salt', 'Oil']);\n\n-- Function to generate order number\nCREATE OR REPLACE FUNCTION public.generate_order_number()\nRETURNS TEXT AS $$\nDECLARE\n  order_num TEXT;\nBEGIN\n  order_num := 'EN' || TO_CHAR(NOW(), 'YYYYMMDD') || LPAD(FLOOR(RANDOM() * 10000)::TEXT, 4, '0');\n  RETURN order_num;\nEND;\n$$ LANGUAGE plpgsql;"}		pravin.pk.me@gmail.com	\N
20251006020822	{"-- Enable RLS on all tables\nALTER TABLE profiles ENABLE ROW LEVEL SECURITY;\nALTER TABLE products ENABLE ROW LEVEL SECURITY;\nALTER TABLE cart_items ENABLE ROW LEVEL SECURITY;\nALTER TABLE orders ENABLE ROW LEVEL SECURITY;\nALTER TABLE order_items ENABLE ROW LEVEL SECURITY;\nALTER TABLE addresses ENABLE ROW LEVEL SECURITY;\n\n-- Profiles policies\nCREATE POLICY \\"Users can view own profile\\" ON profiles\n    FOR SELECT USING (auth.uid() = user_id);\n\nCREATE POLICY \\"Users can update own profile\\" ON profiles\n    FOR UPDATE USING (auth.uid() = user_id);\n\nCREATE POLICY \\"Users can insert own profile\\" ON profiles\n    FOR INSERT WITH CHECK (auth.uid() = user_id);\n\n-- Products policies (allow public read)\nCREATE POLICY \\"Allow public read access to products\\" ON products\n    FOR SELECT USING (true);\n\n-- Cart items policies\nCREATE POLICY \\"Users can manage own cart items\\" ON cart_items\n    FOR ALL USING (auth.uid() = user_id);\n\n-- Orders policies\nCREATE POLICY \\"Users can manage own orders\\" ON orders\n    FOR ALL USING (auth.uid() = user_id);\n\n-- Order items policies\nCREATE POLICY \\"Users can view own order items\\" ON order_items\n    FOR SELECT USING (\n        EXISTS (\n            SELECT 1 FROM orders \n            WHERE orders.id = order_items.order_id \n            AND orders.user_id = auth.uid()\n        )\n    );\n\n-- Addresses policies\nCREATE POLICY \\"Users can manage own addresses\\" ON addresses\n    FOR ALL USING (auth.uid() = user_id);"}	add_missing_rls_policies	pravin.pk.me@gmail.com	\N
20251007065018	{"CREATE TABLE IF NOT EXISTS saved_articles (\n  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,\n  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,\n  url TEXT NOT NULL,\n  title TEXT,\n  summary TEXT NOT NULL,\n  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()\n);\n\n-- Create index for better performance\nCREATE INDEX IF NOT EXISTS idx_saved_articles_user_id ON saved_articles(user_id);\nCREATE INDEX IF NOT EXISTS idx_saved_articles_created_at ON saved_articles(created_at);\n\n-- Enable Row Level Security\nALTER TABLE saved_articles ENABLE ROW LEVEL SECURITY;\n\n-- Create policy to allow users to only see their own articles\nCREATE POLICY \\"Users can view their own articles\\" ON saved_articles\n  FOR SELECT USING (auth.uid() = user_id);\n\n-- Create policy to allow users to insert their own articles\nCREATE POLICY \\"Users can insert their own articles\\" ON saved_articles\n  FOR INSERT WITH CHECK (auth.uid() = user_id);\n\n-- Create policy to allow users to update their own articles\nCREATE POLICY \\"Users can update their own articles\\" ON saved_articles\n  FOR UPDATE USING (auth.uid() = user_id);\n\n-- Create policy to allow users to delete their own articles\nCREATE POLICY \\"Users can delete their own articles\\" ON saved_articles\n  FOR DELETE USING (auth.uid() = user_id);"}	create_saved_articles_table	pravin.pk.me@gmail.com	\N
20251007071456	{"-- Create saved_articles table with proper API exposure\nCREATE TABLE saved_articles (\n  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,\n  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,\n  url TEXT NOT NULL,\n  title TEXT,\n  summary TEXT NOT NULL,\n  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()\n);\n\n-- Create indexes for better performance\nCREATE INDEX idx_saved_articles_user_id ON saved_articles(user_id);\nCREATE INDEX idx_saved_articles_created_at ON saved_articles(created_at);\n\n-- Enable Row Level Security\nALTER TABLE saved_articles ENABLE ROW LEVEL SECURITY;\n\n-- Create policy to allow users to only see their own articles\nCREATE POLICY \\"Users can view their own articles\\" ON saved_articles\n  FOR SELECT USING (auth.uid() = user_id);\n\n-- Create policy to allow users to insert their own articles\nCREATE POLICY \\"Users can insert their own articles\\" ON saved_articles\n  FOR INSERT WITH CHECK (auth.uid() = user_id);\n\n-- Create policy to allow users to update their own articles\nCREATE POLICY \\"Users can update their own articles\\" ON saved_articles\n  FOR UPDATE USING (auth.uid() = user_id);\n\n-- Create policy to allow users to delete their own articles\nCREATE POLICY \\"Users can delete their own articles\\" ON saved_articles\n  FOR DELETE USING (auth.uid() = user_id);\n\n-- Grant necessary permissions\nGRANT ALL ON saved_articles TO authenticated;\nGRANT ALL ON saved_articles TO anon;"}	recreate_saved_articles_table	pravin.pk.me@gmail.com	\N
20251007071532	{"-- Create articles table with different name\nCREATE TABLE articles (\n  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,\n  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,\n  url TEXT NOT NULL,\n  title TEXT,\n  summary TEXT NOT NULL,\n  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()\n);\n\n-- Create indexes for better performance\nCREATE INDEX idx_articles_user_id ON articles(user_id);\nCREATE INDEX idx_articles_created_at ON articles(created_at);\n\n-- Enable Row Level Security\nALTER TABLE articles ENABLE ROW LEVEL SECURITY;\n\n-- Create policy to allow users to only see their own articles\nCREATE POLICY \\"Users can view their own articles\\" ON articles\n  FOR SELECT USING (auth.uid() = user_id);\n\n-- Create policy to allow users to insert their own articles\nCREATE POLICY \\"Users can insert their own articles\\" ON articles\n  FOR INSERT WITH CHECK (auth.uid() = user_id);\n\n-- Create policy to allow users to update their own articles\nCREATE POLICY \\"Users can update their own articles\\" ON articles\n  FOR UPDATE USING (auth.uid() = user_id);\n\n-- Create policy to allow users to delete their own articles\nCREATE POLICY \\"Users can delete their own articles\\" ON articles\n  FOR DELETE USING (auth.uid() = user_id);\n\n-- Grant necessary permissions\nGRANT ALL ON articles TO authenticated;\nGRANT ALL ON articles TO anon;"}	create_articles_table	pravin.pk.me@gmail.com	\N
20251007072058	{"-- Create saved_articles table for the summarizer project\nCREATE TABLE IF NOT EXISTS saved_articles (\n  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,\n  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,\n  url TEXT NOT NULL,\n  title TEXT,\n  summary TEXT NOT NULL,\n  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()\n);\n\n-- Create indexes for better performance\nCREATE INDEX IF NOT EXISTS idx_saved_articles_user_id ON saved_articles(user_id);\nCREATE INDEX IF NOT EXISTS idx_saved_articles_created_at ON saved_articles(created_at);\n\n-- Enable Row Level Security\nALTER TABLE saved_articles ENABLE ROW LEVEL SECURITY;\n\n-- Drop existing policies if they exist\nDROP POLICY IF EXISTS \\"Users can view their own articles\\" ON saved_articles;\nDROP POLICY IF EXISTS \\"Users can insert their own articles\\" ON saved_articles;\nDROP POLICY IF EXISTS \\"Users can update their own articles\\" ON saved_articles;\nDROP POLICY IF EXISTS \\"Users can delete their own articles\\" ON saved_articles;\n\n-- Create policy to allow users to only see their own articles\nCREATE POLICY \\"Users can view their own articles\\" ON saved_articles\n  FOR SELECT USING (auth.uid() = user_id);\n\n-- Create policy to allow users to insert their own articles\nCREATE POLICY \\"Users can insert their own articles\\" ON saved_articles\n  FOR INSERT WITH CHECK (auth.uid() = user_id);\n\n-- Create policy to allow users to update their own articles\nCREATE POLICY \\"Users can update their own articles\\" ON saved_articles\n  FOR UPDATE USING (auth.uid() = user_id);\n\n-- Create policy to allow users to delete their own articles\nCREATE POLICY \\"Users can delete their own articles\\" ON saved_articles\n  FOR DELETE USING (auth.uid() = user_id);\n\n-- Grant necessary permissions\nGRANT ALL ON saved_articles TO authenticated;\nGRANT ALL ON saved_articles TO anon;"}	create_saved_articles_table	pravin.pk.me@gmail.com	\N
20251007072244	{"-- Drop table if exists to ensure clean creation\nDROP TABLE IF EXISTS saved_articles CASCADE;\n\n-- Create saved_articles table for the summarizer project\nCREATE TABLE saved_articles (\n  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,\n  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,\n  url TEXT NOT NULL,\n  title TEXT,\n  summary TEXT NOT NULL,\n  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()\n);\n\n-- Create indexes for better performance\nCREATE INDEX idx_saved_articles_user_id ON saved_articles(user_id);\nCREATE INDEX idx_saved_articles_created_at ON saved_articles(created_at);\n\n-- Enable Row Level Security\nALTER TABLE saved_articles ENABLE ROW LEVEL SECURITY;\n\n-- Create policy to allow users to only see their own articles\nCREATE POLICY \\"Users can view their own articles\\" ON saved_articles\n  FOR SELECT USING (auth.uid() = user_id);\n\n-- Create policy to allow users to insert their own articles\nCREATE POLICY \\"Users can insert their own articles\\" ON saved_articles\n  FOR INSERT WITH CHECK (auth.uid() = user_id);\n\n-- Create policy to allow users to update their own articles\nCREATE POLICY \\"Users can update their own articles\\" ON saved_articles\n  FOR UPDATE USING (auth.uid() = user_id);\n\n-- Create policy to allow users to delete their own articles\nCREATE POLICY \\"Users can delete their own articles\\" ON saved_articles\n  FOR DELETE USING (auth.uid() = user_id);\n\n-- Grant necessary permissions\nGRANT ALL ON saved_articles TO authenticated;\nGRANT ALL ON saved_articles TO anon;"}	create_saved_articles_table_v2	pravin.pk.me@gmail.com	\N
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: -
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 101, true);


--
-- Name: specials_id_seq; Type: SEQUENCE SET; Schema: nagervoild; Owner: -
--

SELECT pg_catalog.setval('nagervoild.specials_id_seq', 24, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict PNvB7SUighYmZ8prTbjg2H7UroGeXpNRZq7w05aMhpHhQbkji3YehOkqIEkWF6c

