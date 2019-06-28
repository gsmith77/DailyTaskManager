class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :status
  belongs_to :list, serializer: ListSerializer
end
