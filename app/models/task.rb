class Task < ApplicationRecord
    belongs_to :user
    belongs_to :list

    def completed
        self.status = "Complete"
    end
end
