FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    explanation { Faker::Lorem.paragraph }
    price { Faker::Number.number(digits: 4) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    situation_id { Faker::Number.between(from: 2, to: 7) }
    liability_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    delivery_days_id { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end