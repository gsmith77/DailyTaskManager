class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :lists, through: :tasks
    validates :name, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true

    def lists_attributes=(list_attributes)
        list_attributes.each do |i, list_attribute|
           list = self.lists.build(list_attribute)
        end
    end
end
