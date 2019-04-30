class Task < ApplicationRecord
    belongs_to :user
    belongs_to :list

    def create_task
    end

    def completed
        self.status = "Complete"
    end
end
