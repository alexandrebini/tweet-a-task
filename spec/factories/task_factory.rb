FactoryGirl.define do
  factory :task do
    name { Faker::Lorem.sentence }
    sequence(:twitter_id){ |n| "#{ Faker::Number.number(10) } #{ n }" }

    after(:build) do |task|
      task.class.skip_callback(:create, :after, :publish)
      task.class.skip_callback(:create, :after, :restart_mention_watcher)
    end
  end
end