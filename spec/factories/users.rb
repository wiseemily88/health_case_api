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

  factory :user_with_family_history, class: User do
        after(:create) do |user|
        f_history    = create(:family_history)
        user.family_histories << f_history
      end
    end
  end
end
