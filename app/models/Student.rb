class Student < ActiveRecord::Base

    has_many :reviews
    has_and_belongs_to_many :klasses
    has_many :teachers, through: :klasses
    
end