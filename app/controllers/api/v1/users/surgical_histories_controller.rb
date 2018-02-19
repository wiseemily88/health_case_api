class Api::V1::Users::SurgicalHistoriesController < ApplicationController
  before_action :find_user


  def index
    render json: @user.surgical_histories
  end

  private
  def find_user
    @user ||= User.find_by(id: params[:user_id])
  end
end
