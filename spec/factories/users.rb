FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@codebattle.org"}
    username { Faker::Internet.user_name }
    name { Faker::Name.name }

    after(:create) do |user|
      n = Guild.count
      rand(1..4).times do
        guild = Guild.find(rand(1..n))
        user.guilds << guild unless user.guilds.include?(guild)
      end
    end
  end
end
