class List < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    belongs_to :user
    validates :title, uniqueness:true, presence: true, on: :new

    def tasks_attributes=(task_attributes)
        task_attributes.each do |i, task_attribute|
           task = Task.find_or_create_by(task_attribute)
           self.tasks << task
        end
    end
end
