class User < ApplicationRecord
  validates :email, presence: :true
  has_secure_password

  has_many :user_medical_histories
  has_many :medical_histories, through: :user_medical_histories
end
