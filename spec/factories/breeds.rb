FactoryBot.define do
  factory :breed do
      tank_size {'60cm'} 
      temperature {'25℃'}
      filter {'外部フィルター'}
      raito {'アクアリウムライト LED'}
      condition {'pH 7.0'}
      sand {'大磯砂'}
      plant {'ミクロソリウム'}
      breeding_text {Faker::Lorem.sentence}

      association :user
      association :fish
      
  end
end
