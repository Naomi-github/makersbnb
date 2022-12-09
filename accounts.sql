CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE listings (
  id SERIAL PRIMARY KEY,
  name text,
  description text,
  availability text,
  price text,
-- The foreign key name is always {other_table_singular}_id
  listings_id int,
  constraint fk_listings foreign key(listings_id)
    references listings(id)
    on delete cascade
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    account_id int,
    listings_id int,
    date_booked date,
    constraint fk_account foreign key(account_id) references accounts(id),
    constraint fk_listings foreign key(listings_id) references listings(id)
);