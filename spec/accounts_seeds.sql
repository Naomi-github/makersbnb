TRUNCATE TABLE accounts, listings, bookings RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (id, email_address, password) VALUES ('1', 'user1@email.com', 'password1');
INSERT INTO accounts (id, email_address, password) VALUES ('2', 'user2@email.com', 'password2');

INSERT INTO listings (name, description, availability, price, listings_id) VALUES ('Cottage', 'Countryside location', 'January', '£50.99', '1');
INSERT INTO listings (name, description, availability, price, listings_id) VALUES ('City flat', '2 bed flat in London', 'January', '£100', '2');
INSERT INTO listings (name, description, availability, price, listings_id) VALUES ('Manor House', 'Large house for over 10 people', 'January', '£1000', '3');
INSERT INTO listings (name, description, availability, price, listings_id) VALUES ('Boat', 'Unique location on the river Thames', 'January', '£45', '4');

INSERT INTO bookings (id, account_id, listings_id, date_booked) VALUES('1', '1', '1', '2022-09-12');
INSERT INTO bookings (id, account_id, listings_id, date_booked) VALUES('2', '2', '2', '2022-06-07');