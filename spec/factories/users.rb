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
      immunizations = create_list(:immunization, 3)
      user.immunizations << immunizations
    end
  end
factory :user_with_health_maintenance, class: User do
      after(:create) do |user|
      health_maintenance = create_list(:health_maintenance, 3)
      user.health_maintenances << health_maintenance
    end
  end
end
end
