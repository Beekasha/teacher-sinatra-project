class Teacher < ActiveRecord::Base
    has_many :reviews
    has_many :students
    
    has_secure_password


end