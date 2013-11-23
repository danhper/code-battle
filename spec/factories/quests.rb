FactoryGirl.define do
  factory :quest do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentences.join "\n" }

    association :creator, factory: :user

    factory :quest_with_codes do
      ignore do
        codes_count 10
      end

      after(:create) do |quest, evaluator|
        FactoryGirl.create_list(:code, evaluator.codes_count,
          quest: quest)
      end
    end
  end
end
