class Api::V1::Users::PrescriptionsController < ApplicationController
  before_action :find_user
  def index
    render json: @user.prescriptions
  end

  def create

    prescription = Prescription.new(user_id: @user.id, name: params[:name], frequency: params[:frequency], dosage: params[:dosage])
    if prescription.save
      render json: prescription
    else
      render json: prescription.errors, status: 400
    end
  end


  private
  def find_user
    @user ||= User.find_by(id: params[:user_id])
  end

  def prescription_params
    params.permit(:name, :frequency, :dosage)
  end
end
