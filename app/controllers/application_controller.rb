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

    def current_klass
      @current_klass ||= Klass.find_by()
    end

    def login(username, password)
      user = Teacher.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
        redirect to '/account'
      else 
        redirect '/failure'
      end
    end

    def logout!
      session.clear
    end
  end

end
