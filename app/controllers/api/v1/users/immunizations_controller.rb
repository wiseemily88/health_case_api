class Api::V1::Users::ImmunizationsController < ApplicationController

  before_action :find_user
  before_action :find_immunization_item, only: [:create, :destroy, :update]


  def index
    render json: @user.immunizations
  end

  def create
    if @user && @immunization
      @user.immunizations << @immunization
    response = {
      data: {
        redcord_id: UserImmunizationHistory.find_by(user_id: @user.id, immunization_id: @immunization.id).id,
        id: @immunization.id,
        name: @immunization.name,
        user: {
          id: @user.id,
        },
        note: {
          note: UserImmunizationHistory.find_by(user_id: @user.id, immunization_id: @immunization.id).note
        },
      }
    }
      render json: response.merge({ message: "Successfully added #{@immunization.name} to #{@user.email}"}), status: 201
    else
      render json: { message: "Cannot find requested immunization and/or user" }, status: 404
    end
  end

  def destroy
    if @user && @immunization
      record = UserImmunizationHistory.find_by(user_id: @user.id, immunization_id: @immunization.id)
      record.destroy
      render json:{ message: "Successfully removed #{@immunization.name} to #{@user.email}"}, status: 200
    else
      render json: { message: "Cannot find requested immunization and/or user" }, status: 404
    end
  end

def update
  record = UserImmunizationHistory.find_by(user_id: @user.id, immunization_id: @immunization.id)
  if record.update(note: params[:note])

  response = {
    data: {
      id: @immunization.id,
      name: @immunization.name,
      user: {
        id: @user.id,
      },
      note: {
        note: record.note
      },
    }
  }
  render json:response.merge({ message: "Successfully updated #{@immunization.name} to #{@user.email}"}), status: 201

  else
    render json: record.errors, status: 400
  end
end


  private

  def find_user
    @user ||= User.find_by(id: params[:user_id])
  end

  def find_immunization_item
    @immunization ||= Immunization.find_by(id: params[:immunization_id])
  end

end
