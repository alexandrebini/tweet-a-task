class PublishManagerJob < ActiveJob::Base
  queue_as :default

  def perform(manager_id)
    manager = Manager.where(id: manager_id).first
    manager.publish!
  end
end
