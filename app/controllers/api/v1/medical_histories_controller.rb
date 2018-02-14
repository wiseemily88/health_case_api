class Api::V1::MedicalHistoriesController < ApplicationController

def index
  render json: MedicalHistory.all
end

end
