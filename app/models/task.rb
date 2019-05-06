class Task < ApplicationRecord
    belongs_to :user
    belongs_to :list

    def self.completed?
        where(status:true)
    end

    def self.incomplete?
        where(status:false)
    end
end
