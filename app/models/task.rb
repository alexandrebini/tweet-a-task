class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :twitter_id, presence: true, uniqueness: true

  after_create :publish

  def publish
    # Integrations.each do |task_managent_tool|
    #   task_managent_tool.create_task name
    # end
  end
end