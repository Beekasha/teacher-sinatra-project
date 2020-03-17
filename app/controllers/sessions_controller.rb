class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post "/login" do
        @user = Teacher.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/account"
        else
            redirect to "sessions/failure"
        end
    end

    post '/sessions' do
        login(params[:username], params[:password])
        redirect to '/'
    end

    get '/logout' do
        logout!
        redirect to '/'
    end
end