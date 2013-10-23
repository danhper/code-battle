FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@codebattle.org"}
    sequence(:username) { |n| "user#{n}" }
    name { Faker::Name.name }
    guilds { [Guild.find(rand(1..Guild.count))] }
  end
end
