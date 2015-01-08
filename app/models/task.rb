class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :twitter_id, presence: true, uniqueness: true
  has_many :managers, dependent: :destroy
  after_create :create_managers

  def self.from_twitter(status)
    Task.new.tap do |task|
      task.name = status.text
    end
  end

  private
  def create_managers
    Manager.descendants.each do |type|
      self.managers.where(type: type).first_or_create
    end
  end
end