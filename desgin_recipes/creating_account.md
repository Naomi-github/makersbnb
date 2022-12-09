# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: Accounts

Columns:
id | email | password


```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE Accounts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO Accounts (id, email, password) VALUES ('user1@email.com', 'password1');
INSERT INTO Accounts (id, email, password) VALUES ('user2@email.com', 'password2');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 accounts < seeds_{accounts}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)
class Account
      attr_accessor :id, :email_address, :password
end

# Repository class
# (in lib/student_repository.rb)
class AccountRepository
require 'account'
require 'createAccount'

  def user_exists?
   find(email_address)
   if true
    return error
  end
  
  def add_user(new_account)
  # pushes account object info to database
    INSERT INTO accounts
    VALUES (id, email_address, password)
  end

#in application
  post '/posts' do
  # Get request body parameters
  email_address = params[:email_address]
  password = params[:password]

  # Do something useful, like creating a post
  # in a database.""
  new_account = Account.new
  new_account.email_address = email_address
  new_account.password = password
  AccountRepository.new.add_user(new_account)

  # Return a view to confirm
  # the form submission or resource creation
  # to the user.
  return erb(:existing_login_page) 
end

  end
  
  

end

# called in application.rb - checked after post request

class createAccount(email, password1, password2)

  def initialize
    @email = email
    @password1 = password1
    @password2 = password2
  end

  # CAN TRY THIS TOO:
  # attr_accessor :id, :email_address, :password1, password2

  def correctEmailFormat?
   .include?(@email.com)
   if false
   return "Error provide valid email address"

  end

  def passwordsMatch? 
  if twoPasswords? == true do
    password1 == password2 do
    if true
    return "Account created"
      if false
  return "Passwords must be the same"
  end

end

tests: -- CONTINUE HERE??? ---------------------------------------------------

  context "POST to /register" do
    it "fails because of email address" do
      # Send a POST request to /register
      # with some body parameters
      # and returns a response object we can test.
      response = post("/register", email: "email.email.com", password: "password", password2: "password")

      # Assert the response status code and body.
      expect(response.status).to eq(404)
      expect(response.body).to eq("Please provide valid email address")
    end


    it "fails because passwords don't match" do
      # Send a POST request to /register
      # with some body parameters
      # and returns a response object we can test.
      response = post("/register", email: "email@email.com", password: "psswrode", password2: "password")

      # Assert the response status code and body.
      expect(response.status).to eq(404)
      expect(response.body).to eq("Passwords must match")
    end
  end




# In Application.rb

# call createAccount - if all methods return true then
# call AccountRepository
```

## write SQL
```
-- EXAMPLE
-- file: account_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE account (
  id SERIAL PRIMARY KEY,
  email_address text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE listings (
  id SERIAL PRIMARY KEY,
  name text,
  description text,
  avaliability int,
-- The foreign key name is always {other_table_singular}_id
  listings_id int,
  constraint fk_listings foreign key(listings_id)
    references listings(id)
    on delete cascade
);
```

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class Account
      attr_accessor :id, :email_address, :password
end

# Repository class
# (in lib/student_repository.rb)
class AccountRepository
require 'account'
require 'createAccount'

  def user_exists?
   find(email_address)
   if true
    return error
  end
  
  def add_user(new_account)
  # pushes account object info to database
    INSERT INTO accounts
    VALUES (id, email_address, password)
  end

#in application
  post '/posts' do
  # Get request body parameters
  email_address = params[:email_address]
  password = params[:password]

  # Do something useful, like creating a post
  # in a database.""
  new_account = Account.new
  new_account.email_address = email_address
  new_account.password = password
  AccountRepository.new.add_user(new_account)

  # Return a view to confirm
  # the form submission or resource creation
  # to the user.
  return erb(:existing_login_page) 
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 2
# Get a single account

repo = AccountRepository.new

account = repo.userExists?('email@email.com')

account.id # =>  1
account.email_address # =>  'email@email.com'
account.password # =>  'Password'

#if it exists throw an error and ask to log in

repo = AccountRepository.new

account = repo.userExists?('email@email.com') # doesn't exist yet
account.id # => 
account.email_address # =>  ''
account.password # =>  ''

# continues creation of account returns nothing
# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/account_repository_spec.rb

def reset_accounts_table
  seed_sql = File.read('spec/seeds_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'accounts' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end
  # (your tests will go here).
end
```

 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

# USED IN REPOSITORY SPEC
repository = AlbumRepository.new

album = Album.new
album.title = 'Trompe le Monde'
album.release_year = 1991
album.artist_id = 1

repository.create(album)

all_albums = repository.all