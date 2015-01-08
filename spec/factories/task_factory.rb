FactoryGirl.define do
  factory :task do
    phrase
    name { Faker::Lorem.sentence }
    sequence(:twitter_id){ |n| "#{ Faker::Number.number(10) } #{ n }" }

    after(:build) do |task|
      task.class.skip_callback(:create, :after, :create_managers)
    end
  end
end