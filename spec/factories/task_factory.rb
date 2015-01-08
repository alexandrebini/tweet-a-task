FactoryGirl.define do
  factory :task do
    name { Faker::Lorem.sentence }
    sequence(:twitter_id){ |n| "#{ Faker::Number.number(10) } #{ n }" }
  end
end