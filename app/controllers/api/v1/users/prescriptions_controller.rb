class Api::V1::Users::PrescriptionsController < ApplicationController
  before_action :find_user
  def index
    render json: @user.prescriptions
  end

  def create
    @prescription = Prescription.new(user_id: @user.id, name: params[:name], frequency: params[:frequency], dosage: params[:dosage])
    if @prescription.save
    response = {
      data: {
          id: @prescription.id,
          name: @prescription.name,
          dosage: @prescription.dosage,
          frequency: @prescription.frequency,
          note: @prescription.note,
          user: {
            id: @user.id,
          },
        }
      }
      render json: response.merge({ message: "Successfully added #{@prescription.name} to #{@user.email}"}), status: 200
    else
      render json: @prescription.errors, status: 400
    end
  end

  def update

    @prescription = Prescription.find_by(id: params[:prescription_id], user_id: @user.id)
    if @prescription.update(prescription_params)
      response = {
        data: {
            id: @prescription.id,
            name: @prescription.name,
            dosage: @prescription.dosage,
            frequency: @prescription.frequency,
            note: @prescription.note,
            user: {
              id: @user.id,
            },
          }
        }
      render json: response.merge( {message: "Successfully added #{@prescription.name} to #{@user.email}"}), status: 200
    else
      render json: @prescription.errors, status: 400
    end
  end

  def destroy
    if prescription = Prescription.find_by(id: params[:prescription_id], user_id: @user.id)
      prescription.destroy
      render json: { message: "Successfully removed #{prescription.name} from #{@user.email}"}, status: 200
    else
      render json: { message: "Cannot find requested user of prescription to delete" }, status: 404
    end
  end



  private
  def find_user
    @user ||= User.find_by(id: params[:user_id])
  end

  def prescription_params
    params.permit(:name, :frequency, :dosage, :note)
  end
end
