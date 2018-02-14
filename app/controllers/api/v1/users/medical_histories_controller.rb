class Api::V1::Users::MedicalHistoriesController < ApplicationController
before_action :find_user

  def index
    render json: @user.medical_histories
  end





private

  def find_user
    @user ||= User.find_by(id: params[:user_id])
  end
end
