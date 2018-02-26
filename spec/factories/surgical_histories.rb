FactoryBot.define do
  factory :surgical_history do
  name { Faker::Color.color_name  }
  date "10/1/2009"
  location 'UT Medical Center'
  physician "Dr. Xanthos"
  user 
  end
end
