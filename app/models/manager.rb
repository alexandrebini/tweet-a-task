class Manager < ActiveRecord::Base
  belongs_to :task, inverse_of: :managers

  enum status: [:pending, :success, :error]

  validates :task, presence: true
  after_create :enqueue_publishing

  private
  def enqueue_publishing
    PublishManagerJob.perform_later(self.id)
  end
end