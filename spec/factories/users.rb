FactoryBot.define do
  factory :user do
    name {Faker::Internet.emai}
    password {Faker::Internet.passwor}
  end
end
