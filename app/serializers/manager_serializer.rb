class ManagerSerializer < ActiveModel::Serializer
  attributes :name, :task_id, :status, :url, :raw

  def name
    object.type.split('::').last
  end
end