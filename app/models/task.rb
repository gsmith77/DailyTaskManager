class Task < ApplicationRecord
    belongs_to :user
    belongs_to :list
    validates :content, presence: true, on: :new, on:create, on: :update

    def self.completed?
        where(status:true)
    end

    def self.incomplete?
        where(status:false)
    end
end
