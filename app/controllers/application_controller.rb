require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "teachersrule"
  end

  get "/welcome" do
    erb :welcome
  end

  get "/" do
    erb :index
  end



  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Teacher.find_by(:username => session[:username]) if session[:username]
    end

    def login(username, password)
      #check if a user with this username actually exists
      #if so, set the session 
      user = Teacher.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
      else 
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end
  end

end
