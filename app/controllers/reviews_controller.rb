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


end