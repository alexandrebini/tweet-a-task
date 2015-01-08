class Phrase < ActiveRecord::Base
  validates :text, presence: true, uniqueness: true
  after_create :create_managers, :restart_mention_watcher

  private
  def restart_mention_watcher
    MentionWatcher.instance.restart
  end
end