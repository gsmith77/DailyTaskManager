class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :bio, :image, :uid
  has_many :lists
end
