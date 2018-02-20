class User < ApplicationRecord
  validates :email, presence: :true
  has_secure_password

  has_many :user_medical_histories
  has_many :medical_histories, through: :user_medical_histories

  has_many :user_family_histories
  has_many :family_histories, through: :user_family_histories

  has_many :user_surgical_histories
  has_many :surgical_histories, through: :user_surgical_histories

  has_many :user_immunization_histories
  has_many :immunizations, through: :user_immunization_histories

  has_many :user_health_maintenances
  has_many :health_maintenances, through: :user_health_maintenances

  has_many :prescriptions
end
