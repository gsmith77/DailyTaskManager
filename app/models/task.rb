class Task < ApplicationRecord
    belongs_to :user
    belongs_to :list
    validates :content, presence: true, if: :content_present?
    attr_accessor content_present

    def content_present?
        self.content_present? == 'true' || self.content_present == true
    end

    def self.completed?
        where(status:true)
    end

    def self.incomplete?
        where(status:false)
    end
end
