class ReviewsController < ApplicationController
    get '/reviews' do
        if logged_in?
            erb :'reviews/reviews'
        else
            redirect to '/login'
        end
    end

    post '/individual_reviews' do
        if logged_in?
            @student_name = params[:student_name]
            erb :'reviews/individual'
        else
            redirect to '/login'
        end
    end

    get '/reviews/new' do
        if logged_in?
            erb :'reviews/new'
        else
            redirect to '/login'
        end
    end

    post '/reviews' do
        if logged_in?
            if params[:content] == ""
                redirect to "/reviews/new"
            else
          

                @student = Student.find_by_name(params[:student_name])
                @review = current_user.reviews.build(content: params[:content], student_id: @student.id) #need to get student choice
                if @review.save
                    redirect to 'teachers/:teacher_id/reviews'
                else
                    redirect to "/reviews/new"
                end
            end
        else
            redirect to '/login'
        end
    end

    get '/teachers/:id/reviews' do
        if logged_in?
            @teacher = Teacher.find_by_id(params[:id])
            erb :'reviews/edit' 
        else
            redirect to '/login'
        end
    end

    post '/reviews' do 
        if logged_in?
            @review = Review.find_by_id(params[:review_id])
        else
            redirect to '/login'
        end
    end

    post '/teachers/:teacher_id/reviews' do
        if logged_in?
            @review = Review.find_by(id: params[:review_id])
            @teacher = Teacher.find_by(id: params[:teacher_id])
            # @review.update(content: params[:content])

            redirect to 'teachers/:teacher_id/reviews'
        else
            redirect to '/login'
        end
    end

    get '/teachers/:teacher_id/reviews/:review_id' do
        if logged_in?
            @teacher = Teacher.find_by(id: params[:teacher_id])
            @review = Review.find_by(id: params[:review_id])
            if @teacher == current_user
                erb :'reviews/editing'
            else
                redirect to '/account'
            end
        else
            redirect to '/login'
        end
    end

    patch '/teachers/:teacher_id/reviews/:review_id' do
        if logged_in?
            @review = Review.find_by_id(params: [:review_id])
            if params[:content] == ""
                redirect to 'teachers/:teacher_id/reviews'
            else
                if @review.teacher == current_user
                    if @review.update(content: params[:content])
                        erb :"/reviews/edit"
                    else
                        redirect to '/account'
                    end
                else
                redirect to '/account'
                end
            end
        else
        redirect to '/login'
        end
    end

    post '/teachers/:teacher_id/reviews/:review_id' do
        if logged_in?
            @teacher = Teacher.find_by_id(params[:teacher_id])
            @review = Review.find_by_id(params[:review_id])
            @student = @review.student
            @review.update(content: params[:content])
            redirect to '/teachers/:teacher_id/reviews'
        else
            redirect to '/login'
        end
    end








    
    get '/teachers/:teacher_id/reviews/:review_id/delete' do
        @review = Review.find_by_id(params[:review_id])
        erb :'/reviews/delete'
    end

    post '/teachers/:teacher_id/reviews/:review_id/delete' do
        if logged_in?
            @review = Review.find_by_id(params[:review_id])
            if @review.teacher == current_user
                @review.delete
            end
            redirect to '/teachers/:teacher_id/reviews'
        else
            redirect to '/login'
        end
    end





end