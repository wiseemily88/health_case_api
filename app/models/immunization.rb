class Immunization < ApplicationRecord
has_many :user_immunization_histories
has_many :users, through: :user_immunization_histories
end
