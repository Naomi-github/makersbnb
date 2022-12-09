GET / new_listings Route Design Recipe
Copy this design recipe template to test-drive a Sinatra route.

1. Design the Route Signature
You'll need to include:

the HTTP method
the path
any query parameters (passed in the URL)
or body parameters (passed in the request body)

Method: GET
Paths: /new_listings
Query params:


2. Design the Response
The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return 200 OK if the post exists, but 404 Not Found if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

Replace the below with your own design. Think of all the different possible responses your route will return.

```
returns the new lisitng form to add details about the property

```


3. Write Examples
Replace these with your own design.

# Request:

GET /new_listings

# Expected response:

Response for 200 OK

<h1> List a space </h1>
<form>
<h1>Name</h1><br>
<p>Description</p><br>
<p>Price per night</p><br>
<p>Available from</p><br>
<p>Available to</p><br>
<submit>List my space</submit><br>
</form>



# Request:



4. Encode as Tests Examples
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /new_listings" do
    it 'returns 200 OK' do
      response = get('/new_lisitngs')

      expected_response = "<h1> List a space </h1>
                            <form>
                            <h1>Name</h1><br>
                            <p>Description</p><br>
                            <p>Price per night</p><br>
                            <p>Available from</p><br>
                            <p>Available to</p><br>
                            <submit>List my space</submit><br>
                            </form>"

      expect(response.status).to eq(200)
      expect(response.body).to include(expected_response)
    end
  end
end

5. Implement the Route
Write the route and web server code to implement the route behaviour.


POST / new_listings Route Design Recipe
Copy this design recipe template to test-drive a Sinatra route.

1. Design the Route Signature
You'll need to include:

the HTTP method
the path
any query parameters (passed in the URL)
or body parameters (passed in the request body)

Method: POST
Paths: /new_listings
Query params:
  user_name, text
  title, text
  decription, text
  price, text
  availablity, text



2. Design the Response
The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return 200 OK if the post exists, but 404 Not Found if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

Replace the below with your own design. Think of all the different possible responses your route will return.

```
adds a new listing to the database

```


3. Write Examples
Replace these with your own design.

# Request:

POST /new_listings

# Expected response:

Response for 200 OK

"Thanks for posting a new lisitng"



# Request:



4. Encode as Tests Examples
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /new_listings" do
    it 'returns 200 OK' do
      response = post('/new_lisitngs')

      expect(response.status).to eq(200)
      expect(response.body).to include("Thanks for posting a new lisitng")
    end
  end
end

5. Implement the Route
Write the route and web server code to implement the route behaviour.

