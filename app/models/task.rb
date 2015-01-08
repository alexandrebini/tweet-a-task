class Task < ActiveRecord::Base
  belongs_to :phrase
  has_many :managers, dependent: :destroy, inverse_of: :task

  validates :name, presence: true
  validates :phrase, presence: true
  validates :twitter_id, presence: true, uniqueness: true
  after_create :create_managers

  def self.create_from_tweet(status)
    phrase = Phrase.find_by_tweet(status)

    if phrase
      task = phrase.tasks.where(twitter_id: status.id).first_or_initialize
      task.name = status.text
      task.save
    else
      false
    end
  end

  private
  def create_managers
    Manager.descendants.each do |type|
      self.managers.where(type: type).first_or_create
    end
  end
end