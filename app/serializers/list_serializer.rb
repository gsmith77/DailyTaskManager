class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at
  belongs_to :user, serializer: UserSerializer
  has_many :tasks, serializer: TaskSerializer
end
