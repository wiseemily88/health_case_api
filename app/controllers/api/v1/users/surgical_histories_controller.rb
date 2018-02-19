class Api::V1::Users::SurgicalHistoriesController < ApplicationController
  before_action :find_user
  before_action :find_surgical_history_item, only: [:create, :destroy, :update]


  def index
    render json: @user.surgical_histories
  end

  def create
    if @user && @surgicalhistory
      @user.surgical_histories << @surgicalhistory
      render json:{ message: "Successfully added #{@surgicalhistory.name} to #{@user.email}"}, status: 201
   else
      render json: { message: "Cannot find requested surgical history and/or user" }, status: 404
    end
  end

  def destroy
    if @user && @surgicalhistory
      record = UserSurgicalHistory.find_by(user_id: @user.id, surgical_history_id: @surgicalhistory.id)
      record.destroy

      render json:{ message: "Successfully removed #{@surgicalhistory.name} to #{@user.email}"}, status: 200
    else
      render json: { message: "Cannot find requested surgical history and/or user" }, status: 404
    end
  end

  def update
    record = UserSurgicalHistory.find_by(user_id: @user.id, surgical_history_id: @surgicalhistory.id)
    if record.update(note: params[:note])
      render json: record
    else
      render json: record.errors, status: 400
    end
  end




  private
  def find_user
    @user ||= User.find_by(id: params[:user_id])
  end

  def find_surgical_history_item
  @surgicalhistory ||= SurgicalHistory.find_by(id: params[:surgical_history_id])
  end
end
