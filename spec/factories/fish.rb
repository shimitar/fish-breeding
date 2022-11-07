FactoryBot.define do
  factory :fish do
      name {Faker::Lorem.sentence}
      size {'10cm'}
      fish_text {Faker::Lorem.sentence}
      image {Faker::Lorem.sentence}
      category_id {2}
      association :user
  end
end
