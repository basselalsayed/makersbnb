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

  get '/Messages' do 

    erb :Messages
  end 
  
  post '/log_in' do
    redirect '/'
  end

  run! if app_file == $0


end 
