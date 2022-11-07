FactoryBot.define do
  factory :fish do
      name {Faker::Lorem.sentence}
      size {'10cm'}
      fish_text {Faker::Lorem.sentence}
      image {Faker::Lorem.sentence}
      association :user
      
  end
end
