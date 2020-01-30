ENV['RACK_ENV'] = 'test'

require 'sinatra/base'
require_relative 'lib/BnB'
require './public/models/user'
require './public/models/booking'
require 'pg'
#require_relative '/public/models/user'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
   
    @userMaster = User.new('email')


    if session[:uid] = @uid
 
      # @BnB = BnBControl.all 

      erb :index_logged_in 
    else
      erb :index
    end
  end

  get '/make_listings' do 
    
    @BnB = BnBControl.all 

    @prop = Property.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      available_from: params[:available_from],
      available_to: params[:available_to]
    )

    # dates = space.make_dates(space.available_from, space.available_to)
    # dates.each do |date|
    #   Availability.create(
    #     date: date,
    #     space_id: space.id
    #   )
    
    erb :make_listings
  end 

  get '/Messages' do 

    erb :Messages
  end 

  get '/index_logged_in' do 

    @proper = Property.all 

    erb :index_logged_in
  end
  
  post '/log_in' do
    redirect '/'

  end

  run! if app_file == $0


 end 
