class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :status
end
