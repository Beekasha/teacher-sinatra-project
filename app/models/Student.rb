class Student < ActiveRecord::Base
    belongs_to :klasses_students
    # has_many :teachers
    has_many :reviews
    has_many :klasses, through: :klasses_students
    
end