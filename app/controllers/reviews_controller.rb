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

    get '/reviews' do
        erb :'reviews/edit'
    end

    post '/reviews' do 
        @review = Review.find_by_id(params[:review_id])
        #redirect to '/reviews/edit/:id'
    end

    post '/reviews/edit/:id' do
        @review = Review.find_by_id(params[:id])
        @review.update(content: params[:content])

        redirect to '/reviews'
    end

    get '/reviews/edit/:id' do
        if logged_in?
            @review = Review.find_by(id: params[:id])
            if @review.teacher == current_user
                erb :'reviews/editing'
            else
                redirect to '/account'
            end
        else
            redirect to '/login'
        end
    end

    patch '/reviews' do
        if logged_in?
            @review = Review.find_by_id(params: [:review_id])
            if params[:content] == ""
                redirect to '/reviews'
            else
                if @review.teacher == current_user
                    if @review.update(content: params[:content])
                        erb :"/reviews/edit"
                    else
                        redirect to "/reviews"
                    end
                else
                redirect to '/reviews'
                end
            end
        else
        redirect to '/login'
        end
    end

    get '/reviews/edit/:id/delete' do
        @review = Review.find_by_id(params[:id  ])
        erb :'/reviews/delete'
    end

    post '/reviews/edit/:id/delete' do
        if logged_in?
            @review = Review.find_by_id(params[:id])
            if @review.teacher == current_user
                @review.delete
            end
            redirect to '/reviews'
        else
            redirect to '/login'
        end
    end





end