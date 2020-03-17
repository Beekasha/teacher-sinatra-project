class KlassesStudents < ActiveRecord::Base
    has_and_belongs_to_many :klasses
    has_and_belongs_to_many :students
end