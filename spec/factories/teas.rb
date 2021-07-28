FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Marketing.buzzwords}
    temperature { Faker::Movie.quote }
    brew_time { Faker::Coffee.intensifier  }
  end
end
