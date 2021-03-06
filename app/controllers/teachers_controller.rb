class TeachersController < ApplicationController
    
    get '/signup' do
        if !logged_in?
            erb :"teachers/signup"
        else
            redirect to '/account'
        end
    end




    post '/signup' do 
        if params[:username] == "" || Teacher.all.collect{|teacher| teacher.username}.include?(params[:username])
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

