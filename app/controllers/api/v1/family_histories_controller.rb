class Api::V1::FamilyHistoriesController < ApplicationController

def index
 render json: FamilyHistory.all

end

end
