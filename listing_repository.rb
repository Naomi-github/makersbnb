require_relative './listing'
require_relative './database_connection'


class ListingRepository
  def all

    listings = []

    sql = 'SELECT id, name, description, availability, price, listings_id FROM listings;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      post = Listing.new
      post.id = record['id']
      post.name = record['name']
      post.description = record['description']
      post.availability = record['availability']
      post.price = record['price']
      post.listings_id  = record['listings_id ']

      listings << post
    end

    return listings
  end

  def create(post)
    sql = 'INSERT INTO listings (name, description, availability, price, listings_id) VALUES ($1, $2, $3, $4, $5);'
    result_set = DatabaseConnection.exec_params(sql, [post.name, post.description, post.availability, post.price, post.listings_id])

    return post
  end
end

