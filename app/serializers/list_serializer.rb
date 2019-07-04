class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at
  has_many :tasks
end
