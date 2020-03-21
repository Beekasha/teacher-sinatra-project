class ReviewsController < ApplicationController
    get '/reviews' do
        erb :'reviews/reviews'
    end

    post '/individual_reviews' do
        @student_name = params[:student_name]
        erb :'reviews/individual'
    end

    get '/reviews/new' do
        erb :'reviews/new'
    end

    post '/reviews' do
        if logged_in?
            if params[:content] == ""
                redirect to "/reviews/new"
            else
          

                @student = Student.find_by_name(params[:student_name])
                @review = current_user.reviews.build(content: params[:content], student_id: @student.id) #need to get student choice
                if @review.save
                    redirect to "/reviews"
                else
                    redirect to "/reviews/new"
                end
            end
        else
        redirect to '/login'
        end
    end

    get '/reviews/edit' do
        erb :'reviews/edit'
    end

    post '/reviews/edit' do 
        @review = Review.find_by_id(params[:review_id])
        @review.

       
    end



end