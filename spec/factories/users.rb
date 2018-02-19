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


  factory :user_with_surgical_history, class: User do
        after(:create) do |user|
        s_history    = create(:surgical_history)
        user.surgical_histories << s_history
      end
    end

  factory :user_with_prescriptions, class: User do
        after(:create) do |user|
        prescriptions    = create_list(:prescription, 3)
        user.prescriptions << prescriptions
      end
    end

factory :user_with_immunization_history, class: User do
      after(:create) do |user|
      immunization    = create(:immunization)
      user.immunization_histories << immunization
    end
  end
  end
end
