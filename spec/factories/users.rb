FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    real_last_name        { Faker::Name.initials(number: 2) }
    real_first_name       { Faker::Name.initials(number: 2) }
    main_last_name        { Faker::Name.initials(number: 2) }
    main_first_name       { Faker::Name.initials(number: 2) }
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end