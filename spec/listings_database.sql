-- -------------------------------------------------------------
-- TablePlus 4.5.0(396)
--
-- https://tableplus.com/
--
-- Database: design
-- Generation Time: 2022-04-27 17:13:27.2140
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."listings";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS listings_id_seq;

-- Table Definition
CREATE TABLE "public"."listings" (
    "id" SERIAL,
    "name" text,
    "description" text,
    "availability" text,
    "price" text,
    "listings_id" text,
    PRIMARY KEY ("id")
);

INSERT INTO listings (name, description, availability, price, listings_id) VALUES
('Cottage', 'Countryside location', 'January', '£50.99', '1'),
('City flat', '2 bed flat in London', 'January', '£100', '2'),
('Manor House', 'Large house for over 10 people', 'January', '£1000', '3'),
('Boat', 'Unique location on the river Thames', 'January', '£45', '4')


