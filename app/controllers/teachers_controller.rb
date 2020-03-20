class TeachersController < ApplicationController
    get '/signup' do
        erb :"teachers/signup"
    end




    post '/signup' do 
        if params[:name] == "" #|| params[:username] == "" || params[:password] = ""
            redirect to '/signup'
        else
            @teacher = Teacher.new(:name => params[:name], :username => params[:username], :password => params[:password])
            if @teacher.save
                session[:teacher_id] = @teacher.id
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



end

