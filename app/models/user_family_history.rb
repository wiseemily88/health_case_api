class UserFamilyHistory < ApplicationRecord
belongs_to :user
belongs_to :family_history
end
