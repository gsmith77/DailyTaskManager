class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :lists, through: :tasks
    #validates :name, uniqueness: true, presence: true
    validates :password, presence: true
    validates :bio, presence: true, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }

    def lists_attributes=(list_attributes)
        list_attributes.each do |i, list_attribute|
           list = List.find_or_create_by(list_attribute)
           self.lists << list
        end
    end
end
