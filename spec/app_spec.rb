require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'json'
require_relative '../account_repository_spec'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # Write your integration tests below.
  # If you want to split your integration tests
  # accross multiple RSpec files (for example, have
  # one test suite for each set of related features),
  # you can duplicate this test file to create a new one.

#returning home page
  context 'GET /' do
    it 'should get the homepage' do
      response = get('/')

      expect(response.status).to eq(200)
    end
  end

#entering user to database
  context 'post /register' do
    it 'should create a user' do
      response = post('/register', id: '3', email_address: 'testemail@email.com', password: "testpassword")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h2 class='title'>Sign up to MakersBnB</h2>")


      # expect(response.body).to include("<h1>Log in to MakersBnB</h1>")
    end
  end

  context 'get /login' do
    it 'should return login page' do
      response = get('/login')
      expect(response.status).to eq 200
      expect(response.body).to include "Log in"
    end
  end

  context 'login page' do
    it 'successful login post request' do
      response = post('/login', email_address: "user1@email.com", password: "password1")
      expect(response.status).to eq 200
    end
  end
end