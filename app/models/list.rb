class List < ApplicationRecord
    has_many :tasks
    belongs_to :user
    validates :title, presence: true, uniqueness:true, on: :new

    def tasks_attributes=(task_attributes)
        task_attributes.each do |i, task_attribute|
           task = Task.find_or_create_by(task_attribute)
           self.tasks << task
        end
    end

    def empty_tasks
        self.tasks = []
    end
end
