class Prescription < ApplicationRecord
validates :name, :frequency, :dosage, presence: :true
belongs_to :user
end
