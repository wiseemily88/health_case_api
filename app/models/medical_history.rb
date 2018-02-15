class MedicalHistory < ApplicationRecord

has_many :user_medical_histories
has_many :users, through: :user_medical_histories
end
