class Api::V1::HealthMaintenancesController < ApplicationController

def index
  render json: HealthMaintenance.all
end

end
