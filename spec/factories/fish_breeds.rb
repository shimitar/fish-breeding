FactoryBot.define do
  factory :fish_breed do
    name { Faker::Lorem.sentence }
    size { '10cm' }
    fish_text { Faker::Lorem.sentence }
    category_id { 2 }
    tank_size { '60cm' }
    temperature { '25℃' }
    filter { '外部フィルター' }
    raito { 'アクアリウムライト LED' }
    condition { 'pH 7.0' }
    sand { '大磯砂' }
    plant { 'ミクロソリウム' }
    breeding_text { Faker::Lorem.sentence }

    after(:create) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end