CREATE TABLE groups
(
  id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  parent_id bigint,
  title character varying(50) NOT NULL,
  CONSTRAINT groups_pkey PRIMARY KEY (id),
  CONSTRAINT groups_title_key UNIQUE (title)
);

CREATE TABLE privileges
(
  id bigint GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  title character varying(50) NOT NULL,
  description character varying(100),
  CONSTRAINT privileges_pkey PRIMARY KEY (id),
  CONSTRAINT privileges_title_key UNIQUE (title)
);

CREATE TABLE group_privilege
(
  privilege_id bigint NOT NULL,
  group_id bigint NOT NULL,
  CONSTRAINT group_privilege_pkey PRIMARY KEY (privilege_id, group_id),
  CONSTRAINT group_fk1 FOREIGN KEY (group_id) REFERENCES groups (id),
  CONSTRAINT privilege_fk FOREIGN KEY (privilege_id) REFERENCES privileges (id)
);

CREATE TABLE resource_group
(
  resource_id character varying(255) NOT NULL,
  group_id bigint NOT NULL,
  CONSTRAINT resource_group1_pkey PRIMARY KEY (resource_id, group_id),
  CONSTRAINT group_fk2 FOREIGN KEY (group_id) REFERENCES groups (id)
);

CREATE SEQUENCE groups_sequence AS BIGINT START WITH 3 INCREMENT BY 10;
CREATE SEQUENCE privileges_sequence AS BIGINT START WITH 1 INCREMENT BY 1;

CREATE TABLE messages
(
  id BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 3, INCREMENT BY 10) NOT NULL PRIMARY KEY,
  text VARCHAR(50) NOT NULL,
  author VARCHAR(50) NOT NULL
);

CREATE TABLE resources
(
  id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
  res_name VARCHAR(50) NOT NULL
);

CREATE TABLE skill_types
(
  id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
  skill_name VARCHAR(50) NOT NULL
);

CREATE TABLE res_skills
(
  id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
  res_id BIGINT NOT NULL,
  skill_id BIGINT,
  CONSTRAINT skill_skilltype_fk FOREIGN KEY (skill_id) REFERENCES skill_types (id)
);

