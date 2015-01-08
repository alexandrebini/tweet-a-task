FactoryGirl.define do
  factory :phrase do
    text { Faker::Lorem.sentence }

    after(:build) do |task|
      task.class.skip_callback(:create, :after, :restart_mention_watcher)
    end
  end
end