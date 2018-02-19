class SurgicalHistory < ApplicationRecord

has_many :user_surgical_histories
has_many :users, through: :user_surgical_histories
end
