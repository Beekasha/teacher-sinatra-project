class StudentsController < ApplicationController
    get '/students' do
        if logged_in?
            erb :"students/show"
        else
            redirect to '/login'
        end
    end

    get '/students/:slug/reviews' do
        if logged_in?
            @student = Student.find_by_slug(params[:slug])
            erb :"reviews/show"
        else
            redirect to '/login'
        end
    end

end