class Api::V1::SurgicalHistoriesController < ApplicationController

def index
  render json: SurgicalHistory.all
end

end
