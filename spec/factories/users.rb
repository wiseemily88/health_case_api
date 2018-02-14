FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}

  factory :user_with_medical_history, class: User do
        after(:create) do |user|
        history    = create(:medical_history)
        user.medical_histories << history
      end
    end
  end
end
