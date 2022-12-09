-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE listings RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO listings (name, description, availability, price, listings_id) VALUES
('Cottage', 'Countryside location', 'January', '£50.99', '1'),
('City flat', '2 bed flat in London', 'January', '£100', '2'),
('Manor House', 'Large house for over 10 people', 'January', '£1000', '3'),
('Boat', 'Unique location on the river Thames', 'January', '£45', '4')



--Write the SQL query to select the record with id 1 from the albums table.

-- repository = ArtistRepository.new

-- artist = repository.find(1) # Performs a SELECT query and returns a single Student object.

-- artist.id # 1
-- artist.name # "David"
