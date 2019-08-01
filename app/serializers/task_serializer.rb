class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :status
  belongs_to :lists, serializer: ListSerializer
end
