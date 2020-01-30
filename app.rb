require 'sinatra/base'
require_relative 'lib/BnB'
require './public/models/user'
require './public/models/booking'
require 'pg'
#require_relative '/public/models/user'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:user] 
      @user = User.login
      @BnB = BnBControl.all 

      erb :index_logged_in 
    else
      erb :index
    end
  end

  get '/make_listings' do 
    
    @BnB = BnBControl.all 
    
    erb :make_listings
  end 

  post '/make_listings' do 
    @prop = Property.create(

    name: params[:name],
      price: params[:price],
      description: params[:description],
      available_from: params[:available_from],
      available_to: params[:available_to]
    )

    erb :make_listings
  end 

  get '/Messages' do 

    erb :Messages
  end 

  get '/index_logged_in' do 
    
    @BnB = BnBControl.all 

    erb :index_logged_in

  end 
  
  post '/sign_in' do
    redirect '/'
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/profile'
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/signin'
    end
  end

  
  run! if app_file == $0


end 
