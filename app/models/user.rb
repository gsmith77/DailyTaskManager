class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :lists, through: :tasks
    #validates :name, uniqueness: true, presence: true
    validates :password, presence: true
    validates :bio, presence: true
    accepts_nested_attributes_for :lists
end
