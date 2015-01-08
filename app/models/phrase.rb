class Phrase < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates :text, presence: true, uniqueness: true
  scope :recent, -> { order('phrases.created_at DESC') }
  after_create :restart_mention_watcher

  def self.find_by_tweet(status)
    self.all.find do |phrase|
      status.text.downcase.match phrase.text.downcase
    end
  end

  private
  def restart_mention_watcher
    MentionWatcher.instance.restart
  end
end