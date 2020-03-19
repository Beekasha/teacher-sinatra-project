class StudentsController < ApplicationController
    get '/students' do
        erb :"students/show"
    end

    # post '/students' do
    #     # @student_name = params[:student_name]
    #     redirect to '/individual_reviews'
    # end
end