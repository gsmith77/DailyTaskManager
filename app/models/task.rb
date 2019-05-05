class Task < ApplicationRecord
    belongs_to :user
    belongs_to :list
    validates :content, length: { minimum: 6,
    too_short: "%{count} characters is the minimum allowed" }

    def self.completed?
        where(status:true)
    end

    def self.incomplete?
        where(status:false)
    end
end
