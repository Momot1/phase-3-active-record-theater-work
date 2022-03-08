class Role < ActiveRecord::Base
    has_many :auditions
    has_many :actors, through: :auditions

    def locations
        self.pluck(:location)
    end

    def lead
        self.actors.first ? self.actors.first : "no actor has been hired for this role"
    end

    def understudy
        self.actors.second ? self.actors.second : "no actor has been hired for understudy for this role"
    end
end