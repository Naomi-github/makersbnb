GET / listings Route Design Recipe
Copy this design recipe template to test-drive a Sinatra route.

1. Design the Route Signature
You'll need to include:

the HTTP method
the path
any query parameters (passed in the URL)
or body parameters (passed in the request body)

Method: GET
Paths: /listings
Query params:


2. Design the Response
The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return 200 OK if the post exists, but 404 Not Found if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

Replace the below with your own design. Think of all the different possible responses your route will return.

```
returns all listings in alphabetical order currently in database

```


3. Write Examples
Replace these with your own design.

# Request:

GET /listings

# Expected response:

Response for 200 OK

<h1> Book a space </h1>
<a href="list a space">List a space</a>
<p>list of listings</p>

# Request:



4. Encode as Tests Examples
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /listings" do
    it 'returns 200 OK' do
      response = get('/lisitngs')

      expected_response = "<h1> Book a space </h1>
                            <a href="list a space">List a space</a>
                            <p>('user_1', 'Cottage', 'Countryside location', '50.99'),
                            ('user_2','City flat', '2 bed flat in London', '100'),
                            ('user_3','Manor House', 'Large house for over 10 people', '1000'),
                            ('user_4','Boat', 'Unique location on the river Thames', '45')</p>"

      expect(response.status).to eq(200)
      expect(response.body).to include(expected_response)
    end
  end
end

5. Implement the Route
Write the route and web server code to implement the route behaviour.
