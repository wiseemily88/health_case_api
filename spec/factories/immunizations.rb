FactoryBot.define do
  factory :immunization do
    name { Faker::Color.color_name  }
  end
end
