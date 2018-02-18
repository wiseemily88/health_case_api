class Api::V1::Users::FamilyHistoriesController < ApplicationController
before_action :find_user
before_action :find_family_history_item, only: [:create]


  def index
    render json: @user.family_histories
  end

def create
    if @user && @familyhistory
      @user.family_histories << @familyhistory
      render json:{ message: "Successfully added #{@familyhistory.name} to #{@user.email}"}, status: 201
   else
      render json: { message: "Cannot find requested family history and/or user" }, status: 404
    end

end

private
def find_user
  @user ||= User.find_by(id: params[:user_id])
end

  def find_family_history_item
    @familyhistory ||= FamilyHistory.find_by(id: params[:family_history_id])
  end

end
