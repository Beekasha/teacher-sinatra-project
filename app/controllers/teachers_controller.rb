class TeachersController < ApplicationController
    get '/signup' do
        erb :"teachers/signup"
    end




    post '/signup' do 
        if params[:username] == "" || params[:name] == "" || params[:password] = ""
            redirect to '/signup'
        else
            @teacher = Teacher.new
            @teacher.username = params[:username]
            @teacher.password = params[:password]
            if @teacher.save
                redirect '/login'
            else
                erb :"sessions/failure"
            end
        end
    end

    get '/account' do
        erb :'teachers/account'
    end
    
end

