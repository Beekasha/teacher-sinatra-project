class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post '/sessions' do
        login(params[:username], params[:password])
        redirect to '/reviews'
    end

    get '/logout' do
        logout!
        redirect to '/reviews'
    end
end