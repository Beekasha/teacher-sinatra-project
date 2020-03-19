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
        if logged_in?
            erb :'teachers/account'
        else
            erb :"sessions/failure"
        end
    end


    get '/classes' do
        erb :'klasses/show'
    end
    
    post '/classes' do #might have some trouble here

        redirect to '/classroom'
        
    end

    get '/classroom' do
        erb :'klasses/classroom'
    end
end

