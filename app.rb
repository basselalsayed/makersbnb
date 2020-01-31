#ENV['RACK_ENV'] = 'test'
# if i uncomment this line and set to test env the index_logged_in page breaks.
# i dont know what to do here

require 'sinatra/base'
require_relative 'lib/BnB'
require './public/models/user'
require './public/models/booking'
require 'pg'
require_relative './public/models/property'
#require_relative '/public/models/user'

class BnB < Sinatra::Base
  enable :sessions

  before do
    @property = Property
    p '-------'
    p @property #not getting anything outta p ?
    @user = session[:user]
  end
  
  get '/' do   
    # @userMaster = User.new('email')

    # if session[:uid] = @uid
    if session[:user]
      erb :index_logged_in 
    else
      erb :index
    end
  end

  get '/make_listings' do 

    # @BnB = BnBControl.all 

    # @prop = Property.create(
    #   address: params[:address],
    #   post_code: params[:post_code],
    #   photo: params[:photo],
    #   pid: params[:pid],
    #   uid: params[:uid]
    # )

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
    p @proper
    erb :index_logged_in
  end
  
  post '/log_in' do
    # User.log_in returns an instance of User with the attributes from the relevant row in the db
    session[:user] = User.login(params[:email], params[:password])
    redirect '/'
  end

  run! if app_file == $0


 end 
