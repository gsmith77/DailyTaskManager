class List < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    validates :title, presence: true, uniqueness:true

    def tasks_attributes=(task_attributes)
        task_attributes.each do |i, task_attribute|
           task = Task.find_or_create_by(task_attribute)
           self.tasks << task
        end
    end
end
