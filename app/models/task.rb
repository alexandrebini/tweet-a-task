class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :twitter_id, presence: true, uniqueness: true

  after_create :publish, :restart_mention_watcher

  def publish
    Integrations.all.each do |integration_class|
      integration_class.new.create_task name
    end
  end

  def restart_mention_watcher
    MentionWatcher.instance.restart
  end
end