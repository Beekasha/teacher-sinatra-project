class Teacher < ActiveRecord::Base
    has_many :klasses
    has_many :reviews
    has_many :students, through: :klasses
    
    has_secure_password
end