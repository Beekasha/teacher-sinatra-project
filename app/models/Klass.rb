class Klass < ActiveRecord::Base
    has_and_belongs_to_many :student
    belongs_to :teacher 

    def slug
        name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Klass.all.find{|k| k.slug == slug}
    end
end