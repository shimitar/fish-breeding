FactoryBot.define do
  factory :fish do
    name { Faker::Lorem.sentence }
    size { '10cm' }
    fish_text { Faker::Lorem.sentence }
    category_id { 2 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/test_image.png'), 'image/png') }

    association :user
  end
end
