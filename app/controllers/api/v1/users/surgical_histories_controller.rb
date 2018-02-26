class Api::V1::Users::SurgicalHistoriesController < ApplicationController
  before_action :find_user

  def index
    render json: @user.surgical_histories
  end

  def create

    @surgicalhistory = SurgicalHistory.new(user_id: @user.id, name: params[:name], date: params[:date], location: params[:location], physician: params[:physician] )
    if @surgicalhistory.save
      response = {
        data: {
          id: @surgicalhistory.id,
          name: @surgicalhistory.name,
          date: @surgicalhistory.date,
          location: @surgicalhistory.location,
          physician: @surgicalhistory.physician,
          user: {
            id: @user.id,
          },
        }
      }
      render json: response.merge({ message: "Successfully added #{@surgicalhistory.name} to #{@user.email}"}), status: 201
    else
      render json: { message: "Cannot find requested surgical history and/or user" }, status: 404
    end
  end

    def destroy
      if surgicalhistory = SurgicalHistory.find_by(user_id: params[:user_id], id: params[:surgical_history_id])
        surgicalhistory.destroy
        render json:{ message: "Successfully removed #{surgicalhistory.name} to #{@user.email}"}, status: 200
      else
        render json: { message: "Cannot find requested surgical history and/or user" }, status: 404
      end
    end

    def update
      @surgicalhistory = SurgicalHistory.find_by(user_id: params[:user_id], id: params[:surgical_history_id])
      if @surgicalhistory.update(surgical_history_params)

        response = {
          data: {
            id: @surgicalhistory.id,
            name: @surgicalhistory.name,
            date: @surgicalhistory.date,
            location: @surgicalhistory.location,
            physician: @surgicalhistory.physician,
            user: {
              id: @user.id,
            },
          }
        }
        render json: response.merge( {message: "Successfully updated #{@surgicalhistory.name} to #{@user.email}"}), status: 200
      else
        render json: @surgicalhistories.errors, status: 400
      end
    end


    private
    def find_user
      @user ||= User.find_by(id: params[:user_id])
    end

    def surgical_history_params
      params.permit(:name, :location, :date, :physician)
    end

end
