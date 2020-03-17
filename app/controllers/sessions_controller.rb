class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login.html'
    end

    post '/sessions' do
        login(params[:username], params[:password])
        redirect to '/posts'
    end

    get '/logout' do
        logout!
        redirect to '/posts'
    end
end