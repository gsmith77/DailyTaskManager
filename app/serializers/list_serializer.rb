class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :time
  has_many :tasks
  
  def time
    object.created_at.strftime("%A,  %b %d,  %Y")
  end
  
end
