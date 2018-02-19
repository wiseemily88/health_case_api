class Api::V1::ImmunizationsController < ApplicationController

def index
  render json: Immunization.all
end

end
