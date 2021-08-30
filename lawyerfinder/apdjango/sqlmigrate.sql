BEGIN;
--
-- Create model CertificateLearnerLink
--
--
-- Create model Certificates
--
--
-- Create model CourseEval
--
--
-- Create model Courses
--
--
-- Create model Sections
--
--
-- Create model Sessions
--
--
-- Create model CustomUser
--
CREATE TABLE "users" ("user_id" serial NOT NULL PRIMARY KEY, "last_login" varchar(32) NULL, "username" varchar(30) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "occupation" varchar(50) NULL, "biography" varchar(150) NULL, "website" varchar(30) NULL, "linkedin" varchar(30) NULL, "youtube" varchar(30) NULL, "researchgate" varchar(30) NULL, "twitter" varchar(30) NULL, "facebook" varchar(30) NULL, "email" varchar(30) NOT NULL UNIQUE, "password" varchar(100) NOT NULL, "country" varchar(2) NULL, "photo" varchar(30) NULL, "creation_date" text NULL, "is_active" boolean NOT NULL, "is_admin" boolean NOT NULL);
CREATE INDEX "users_username_e8658fc8_like" ON "users" ("username" varchar_pattern_ops);
CREATE INDEX "users_email_0ea73cca_like" ON "users" ("email" varchar_pattern_ops);
COMMIT;
