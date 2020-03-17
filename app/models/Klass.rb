class Klass < ActiveRecord::Base
    belongs_to :klasses_students, polymorphic: true
    belongs_to :teacher
    has_many :students, through: :klasses_students
    

    
end