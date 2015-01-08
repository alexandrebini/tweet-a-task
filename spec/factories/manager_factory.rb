FactoryGirl.define do
  factory :manager do
    task

    after(:build) do |manager|
      manager.class.skip_callback(:create, :after, :enqueue_publishing)
    end
  end
end