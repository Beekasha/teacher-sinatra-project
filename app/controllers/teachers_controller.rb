class TeachersController < ApplicationController
    get '/signup' do
        erb :"teachers/signup"
    end




    post '/teachers' do 
        @teacher = Teacher.new
        @teacher.username = params[:username]
        @teacher.password = params[:password]
        if @teacher.save
            redirect '/login'
        else
            erb :"teachers/signup"
        end
    end

    
end
