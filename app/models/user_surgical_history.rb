class UserSurgicalHistory < ApplicationRecord
  belongs_to :user
  belongs_to :surgical_history
end
