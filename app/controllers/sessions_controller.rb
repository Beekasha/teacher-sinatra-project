class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post "/login" do
        login

    end

    post '/sessions' do
        login(params[:username], params[:password])
        redirect to '/'
    end

    get '/logout' do
        logout!
        redirect to '/'
    end

    get '/failure' do
        erb :'sessions/failure'
    end
end