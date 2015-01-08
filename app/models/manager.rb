class Manager < ActiveRecord::Base
  enum status: [:pending, :success, :error]
  after_create :enqueue_publishing

  private
  def enqueue_publishing
    PublishManagerJob.perform_later(self.id)
  end
end