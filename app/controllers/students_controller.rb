class TeachersController < ApplicationController
    get '/students' do
        erb :"students/show"
    end
end