class Student < ActiveRecord::Base

    has_many :reviews
    has_and_belongs_to_many :klasses
    has_many :teachers, through: :klasses


    def slug
        id
    end

    def self.find_by_slug(slug)
        Student.all.find{|s| s.id.to_s == slug} #had to change s.id to a string to compare to slug
    end
    
end