class StudentsController < ApplicationController
    get '/students' do
        erb :"students/show"
    end

    get '/students/:slug/reviews' do
        @student = Student.find_by_slug(params[:slug])
        erb :"reviews/individual"
    end

    # post '/students' do
    #     # @student_name = params[:student_name]
    #     redirect to '/individual_reviews'
    # end


end