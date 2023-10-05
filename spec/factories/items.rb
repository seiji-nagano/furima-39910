FactoryBot.define do
  factory :item do
    image         {Faker::Lorem.sentence}
    title          {"名前"}
    explanation    {"説明"}
    price           {2000}
    category_id          {1}
    situation_id         {1}
    liability_id         {1}
    prefecture_id        {1}
    delivery_days_id     {1}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end