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

                @review = current_user.reviews.build(content: params[:content], student_id: params[:student_id]) #need to get student choice
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


end