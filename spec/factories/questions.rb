FactoryBot.define do
  factory :question do
    question_text { Faker::Lorem.sentence }

    association :user
    association :fish
  end
end
