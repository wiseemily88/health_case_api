class UserMedicalHistory < ApplicationRecord
  belongs_to :user
  belongs_to :medical_history
end
