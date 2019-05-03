class Task < ApplicationRecord
    belongs_to :user
    belongs_to :list
    validates :content, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }

end
