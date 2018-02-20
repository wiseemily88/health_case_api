class HealthMaintenance < ApplicationRecord
has_many :user_health_maintenances
has_many :users, through: :user_health_maintenances
end
