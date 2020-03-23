class KlassesController < ApplicationController

    get '/classes' do
        if logged_in?
            erb :'klasses/show'
        else
            redirect to '/login'
        end
    end
    
    post '/classes' do #might have some trouble here
        if logged_in?
            redirect to '/classroom'
        else
            redirect to '/login'
        end
        
    end

    get '/classroom/:slug' do
        if logged_in?
            @klass = Klass.find_by_slug(params[:slug])
            erb :'klasses/classroom'
        else
            redirect to '/login'
        end
    end





end