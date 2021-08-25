DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS sessions CASCADE;
DROP TABLE IF EXISTS sections CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS course_eval CASCADE;
DROP TABLE IF EXISTS certificates CASCADE;
DROP TABLE IF EXISTS certificate_learner_link CASCADE;
DROP TABLE IF EXISTS documents CASCADE;

CREATE TABLE users
(
  user_id int GENERATED ALWAYS AS IDENTITY,
  -- type varchar(10)   NOT NULL, --teacher, learner, admin
  is_active boolean not null default false,
  is_teacher boolean not null default false,
  is_learner boolean not null default false,
  is_admin boolean not null default false,
  -- is_superuser boolean not null,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  occupation varchar(50),
  biography varchar(150),
  website varchar(30),
  linkedin varchar(30),
  youtube varchar(30),
  researchgate varchar(30),
  twitter varchar(30),
  facebook varchar(30),
  email varchar(30),
  username varchar(30) NOT NULL,
  password varchar(30) NOT NULL,
  country varchar(2),
  photo varchar(30),
  creation_date text default CURRENT_TIMESTAMP,
  last_login varchar(20),
  PRIMARY KEY (user_id)
);

-- ALTER TABLE user ADD CONSTRAINT pk_user
--   PRIMARY KEY (user_id)

CREATE TABLE courses
(
  course_id int GENERATED ALWAYS AS IDENTITY,
  is_active boolean not null default false,
  title varchar(50) NOT NULL,
  image varchar(100) NOT NULL,
  video varchar(100) NOT NULL,
  category varchar(20) NOT NULL,
  subcategory varchar(20) not null,
  user_count bigint DEFAULT 0 NOT NULL,
  teacher_id serial not null, -- teacher can be null because teachers can be different from a subcourse to another 
  -- creation_date varchar(19) NOT NULL,
  language varchar(2) NOT NULL,
  cost integer NOT NULL,
  long_desc varchar(300) NOT NULL,
  short_desc varchar(100) NOT NULL,
  target_audience varchar(30) NOT NULL,
  goal varchar(200) NOT NULL,
  rating integer,
  duration integer,
  creation_date text default CURRENT_TIMESTAMP,
  update_date varchar(19),
  PRIMARY KEY (course_id),
  CONSTRAINT fk_teacher
    FOREIGN KEY(teacher_id) 
      REFERENCES users(user_id)
);

create table sections 
(
  section_id int generated always as identity,
  is_active boolean not null default true,
  title varchar(50) not null,
  image varchar(100) not null,
  video varchar(100) not null,
  user_count bigint default 0 not null,
  course_id serial not null,
  -- teacher_id serial not null,
  -- creation_date varchar(19) not null,
  -- cost integer not null,
  long_desc varchar(300) not null,
  short_desc varchar(100),
  target_audience varchar(100) not null,
  goal varchar(200) not null,
  duration integer,
  creation_date text default current_timestamp,
  update_date varchar(19),
  PRIMARY KEY (section_id),
  -- constraint fk_teacher
  --   foreign key(teacher_id) 
  --     references users(user_id),
  CONSTRAINT fk_course
    FOREIGN KEY(course_id) 
      REFERENCES courses(course_id)
);

create table sessions 
(
  session_id int generated always as identity,
  is_active boolean not null default true,
  title varchar(50) not null,
  image varchar(100) not null,
  video varchar(100) not null,
  -- user_count bigint default 0 not null,
  section_id serial not null,
  -- teacher_id serial not null,
  -- creation_date varchar(19) not null,
  -- cost integer not null,
  long_desc varchar(300) not null,
  short_desc varchar(100),
  target_audience varchar(100) not null,
  goal varchar(200) not null,
  duration integer,
  creation_date text default current_timestamp,
  update_date varchar(19),
  PRIMARY KEY (session_id),
  -- constraint fk_teacher
  --   foreign key(teacher_id) 
  --     references users(user_id),
  CONSTRAINT fk_section
    FOREIGN KEY(section_id) 
      REFERENCES sections(section_id)
);
-- alter table course add constraint pk_course
--   primary key (course_id);

CREATE TABLE course_learner_relation
(
  id int GENERATED ALWAYS AS IDENTITY,
  is_active boolean not null default true,
  is_certified boolean not null default false,
  course_id serial NOT NULL,
  learner_id serial NOT NULL, --any user (teacher or learner can evaluate courses)
  creation_date text default CURRENT_TIMESTAMP, --date of course purchase
  last_access_date varchar(19),
  PRIMARY KEY (id),
  CONSTRAINT fk_course
    FOREIGN KEY(course_id) 
      REFERENCES courses(course_id),
  -- CONSTRAINT fk_subcourse
  --   FOREIGN KEY(subcourse_id) 
  --     REFERENCES subcourses(subcourse_id),
  CONSTRAINT fk_learner
    FOREIGN KEY(learner_id) 
      REFERENCES users(user_id)
);

CREATE TABLE course_eval
(
  id int GENERATED ALWAYS AS IDENTITY,
  is_active boolean not null default true,
  course_id serial,
  -- subcourse_id serial,
  user_id serial NOT NULL, --any user (teacher or learner can evaluate courses)
  creation_date text default CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_course
    FOREIGN KEY(course_id) 
      REFERENCES courses(course_id),
  -- CONSTRAINT fk_subcourse
  --   FOREIGN KEY(subcourse_id) 
  --     REFERENCES subcourses(subcourse_id),
  CONSTRAINT fk_user
    FOREIGN KEY(user_id) 
      REFERENCES users(user_id)
);

CREATE TABLE certificates 
(
  certificate_id int GENERATED ALWAYS AS IDENTITY,
  is_active boolean not null default true,
  title varchar(30) NOT NULL,
  course_id serial NOT NULL,
  creation_date text default CURRENT_TIMESTAMP,
  PRIMARY KEY (certificate_id),
  CONSTRAINT fk_course
    FOREIGN KEY(course_id) 
      REFERENCES courses(course_id)
);

CREATE TABLE certificate_learner_link 
(
  id int GENERATED ALWAYS AS IDENTITY,
  certificate_id serial NOT NULL,
  learner_id serial NOT NULL,
  creation_date text default CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_certificate
      FOREIGN KEY(certificate_id) 
	  REFERENCES certificates(certificate_id),
  CONSTRAINT fk_learner
    FOREIGN KEY(learner_id) 
      REFERENCES users(user_id)
);

CREATE TABLE documents 
(
  doc_id int GENERATED ALWAYS AS IDENTITY,
  -- is_active boolean not null default false,
  title varchar(50) NOT NULL,
  file varchar(100) NOT NULL,
  course_id serial,
  session_id serial,
  teacher_id serial, -- teachers certificates and identity papers
  creation_date text default CURRENT_TIMESTAMP,
  update_date varchar(19),
  PRIMARY KEY (doc_id),
  CONSTRAINT fk_course
    FOREIGN KEY(course_id) 
      REFERENCES courses(course_id),
  CONSTRAINT fk_session
    FOREIGN KEY(session_id) 
      REFERENCES sessions(session_id),
  CONSTRAINT fk_teacher
    FOREIGN KEY(teacher_id) 
      REFERENCES users(user_id)
);