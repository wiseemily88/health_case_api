FactoryBot.define do
  factory :prescription do
  name { Faker::Color.color_name  }
  dosage "100mm"
  frequency "weekly"
  user
  end
end
