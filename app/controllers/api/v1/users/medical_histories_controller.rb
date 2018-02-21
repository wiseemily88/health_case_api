class Api::V1::Users::MedicalHistoriesController < ApplicationController
before_action :find_user
before_action :find_medical_history_item, only: [:create, :destroy, :update]

  def index
    render json: @user.medical_histories
  end

  def create
    if @user && @medicalhistory

      @user.medical_histories << @medicalhistory
      response = {
        data: {
          redcord_id: UserMedicalHistory.find_by(user_id: @user.id, medical_history_id: @medicalhistory.id).id,
          id: @medicalhistory.id,
          name: @medicalhistory.name,
          user: {
            id: @user.id,
          },
          note: {
            note: UserMedicalHistory.find_by(user_id: @user.id, medical_history_id: @medicalhistory.id).note
          },
        }
      }
      render json: response.merge({ message: "Successfully added #{@medicalhistory.name} to #{@user.email}"}), status: 201
   else
      render json: { message: "Cannot find requested medicalhistory and/or user" }, status: 404
    end
  end

  def destroy
    if @user && @medicalhistory
      record = UserMedicalHistory.find_by(user_id: @user.id, medical_history_id: @medicalhistory.id)
      record.destroy

      render json: { message: "Successfully removed #{@medicalhistory.name} from #{@user.email}"}, status: 200
    else
      render json: { message: "Cannot find requested user of medical condition to delete" }, status: 404
    end
  end

  def update
    record = UserMedicalHistory.find_by(user_id: @user.id, medical_history_id: @medicalhistory.id)
    if record.update(note: params[:note])
      response = {
        data: {
          id: @medicalhistory.id,
          name: @medicalhistory.name,
          user: {
            id: @user.id,
          },
          note: {
            note: record.note
          },
        }
      }
      render json:response.merge({ message: "Successfully updated #{@medicalhistory.name} to #{@user.email}"}), status: 201
    else
      render json: record.errors, status: 400
    end
  end

private


  def find_user
    @user ||= User.find_by(id: params[:user_id])
  end

  def find_medical_history_item
    @medicalhistory ||= MedicalHistory.find_by(id: params[:medical_history_id])
  end
end
