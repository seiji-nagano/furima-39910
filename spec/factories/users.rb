FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    real_first_name { person.first.kanji }
    real_last_name { person.last.kanji }
    main_first_name { person.first.katakana }
    main_last_name { person.last.katakana }
    date_of_birth { Faker::Date.backward }
  end
end
