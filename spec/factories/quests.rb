FactoryGirl.define do
  factory :quest do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentences.join "\n" }

    association :creator, factory: :user
  end
end
