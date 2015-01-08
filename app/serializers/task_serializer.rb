class TaskSerializer < ActiveModel::Serializer
  attributes :id, :phrase_id, :name, :twitter_id
end