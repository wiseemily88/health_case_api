class Api::V1::Users::PrescriptionsController < ApplicationController
  before_action :find_user
  def index
    render json: @user.prescriptions
  end

  private
  def find_user
    @user ||= User.find_by(id: params[:user_id])
  end
end
