class List < ApplicationRecord
    has_many :users
    has_many :users, through: :tasks
end
