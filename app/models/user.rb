class User < ApplicationRecord
  validates :email, presense: true

  has_many :user_medical_histories
  has_many :medical_histories, through: :user_medical_histories
end
