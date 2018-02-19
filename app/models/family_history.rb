class FamilyHistory < ApplicationRecord
has_many :user_family_histories
has_many :users, through: :user_family_histories
end
