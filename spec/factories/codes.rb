FactoryGirl.define do
  factory :code do
    source { Faker::Lorem.paragraphs.join "\n" }
    guild { Guild.find(rand(1..Guild.count)) }

    association :quest, factory: :quest
    association :author, factory: :user
  end
end
