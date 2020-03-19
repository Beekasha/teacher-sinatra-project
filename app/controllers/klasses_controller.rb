class KlassesController < ApplicationController

    get '/classes' do
        erb :'klasses/show'
    end
    
    post '/classes' do #might have some trouble here

        redirect to '/classroom'
        
    end

    get '/classroom' do
        erb :'klasses/classroom'
    end


    
    def slug
        name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Klass.all.find{|k| k.slug == slug}
    end

end