require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /listings" do
    it 'returns 200 OK' do
      response = get('/listings')

      expect(response.status).to eq(200)
      expect(response.body).to include("Book a space")
      expect(response.body).to include("List a space")
      expect(response.body).to include("Cottage")
      expect(response.body).to include("City flat")
      expect(response.body).to include("Manor House")
      expect(response.body).to include("Boat")
      expect(response.body).to include("Unique location on the river Thames")
      expect(response.body).to include("45")
    end
  end

  context "GET /new_listing" do
    it 'returns 200 OK' do
      response = get('/new_listing')

      expect(response.status).to eq(200)
      expect(response.body).to include("<label> Name of property</label>")
    end
  end

  context "POST /new_listing" do
    it 'returns 200 OK' do
      response = post('/new_listing', name: 'Flat', description: 'Central London', availability: 'Feb', price: '£50.99', listings_id: '5')

      expect(response.status).to eq(200)
      expect(response.body).to include("Thanks for posting a new listing")
    end
  end
end

