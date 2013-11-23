FactoryGirl.define do
  factory :code do
    source { Faker::Lorem.paragraphs.join "\n" }

    association :quest, factory: :quest
    association :author, factory: :user

    after(:build) do |code|
      if code.guild.nil? && !code.author.nil?
        code.guild = code.author.guilds.first
      end
    end
  end
end
