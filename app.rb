require 'sinatra/base'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
    # # if session[:user]
      erb :index_logged_in
    # else
      # erb :index
    # end
  end


  get '/make_listings' do
    erb :make_listings
  end

  post '/log_in' do
    redirect '/'
  end

  run! if app_file == $0


end
