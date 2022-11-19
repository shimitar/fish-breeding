FactoryBot.define do
  factory :answer do
    answer_text { Faker::Lorem.sentence }

    association :user
    association :fish
    association :question
  end
end
