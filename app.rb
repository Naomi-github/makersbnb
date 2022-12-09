require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/account_repository'
require_relative 'lib/account'
require_relative 'lib/listing_repository'
require_relative 'lib/listing'
DatabaseConnection.connect('makersbnb_test')

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/account_repository'
  end

  get '/' do
    return erb(:index)
  end

  get '/listings' do

    repo = ListingRepository.new

    @listings = repo.all

    return erb(:listings)
  end

  post '/new_listing' do

    if invalid_request_parameters?
      status 400
      return 'invalid request'
    end

    repo = ListingRepository.new
    new_listing = Listing.new
    new_listing.name = params[:name]
    new_listing.description = params[:description]
    new_listing.availability = params[:availability]
    new_listing.price = params[:price]
    new_listing.listings_id = params[:listings_id]

    repo.create(new_listing)

    return 'Thanks for posting a new listing'
  end

  def invalid_request_parameters?
    params[:name] == nil || params[:description] ==nil || params[:availability] == nil || params[:price] == nil
  end

  get '/new_listing' do

    return erb(:new_listing)
  end



  get '/register' do
    return erb(:register)
  end

  post '/posts' do
    # Get request body parameters
    email_address = params[:email_address]
    password = params[:password]
  end

 #creating new user
  post '/register' do

    email = params[:email_address]
    password = params[:password]
    id = params[:id]

    users = Account.new

    users.email_address = email
    users.password = password
    users.id = id

    AccountRepository.new.create(users)

    return erb(:register)
  end

  get '/existing_user' do

    return erb(:existing_user)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    #account_repo = AccountRepository.new()
    email = params[:email_address]
    password = params[:password]


    repo = AccountRepository.new
    users = Account.new

    users.email_address = ("user1@email.com")
    users.password = ("password1")

    
    user = repo.user_exists?(users.email_address)

    if user != users.email_address
      return erb(:register)

    elsif user == users.email_address
      session[:user_id] = users.id
      return erb(:listings)
    else
      #error = "Incorrect password"
     return erb(:login)
    end
  end
end
