class Api::V1::Users::HealthMaintenancesController < ApplicationController
  before_action :find_user
  before_action :find_health_maintenance_item, only: [:create, :destroy, :update]

  def index
    render json: @user.health_maintenances
  end

  def create
    if @user && @health_maintenance
      @user.health_maintenances << @health_maintenance
      render json:{ message: "Successfully added #{@health_maintenance.name} to #{@user.email}"}, status: 201
    else
      render json: { message: "Cannot find requested health maintenance and/or user" }, status: 404
    end
  end

  def destroy
    if @user && @health_maintenance
      record = UserHealthMaintenance.find_by(user_id: @user.id, health_maintenance_id: @health_maintenance.id)
      record.destroy

      render json: { message: "Successfully removed #{@health_maintenance.name} from #{@user.email}"}, status: 200
    else
      render json: { message: "Cannot find requested user of health_maintenance to delete" }, status: 404
    end
  end

  def update
    record = UserHealthMaintenance.find_by(user_id: @user.id, health_maintenance_id: @health_maintenance.id)
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

  def find_health_maintenance_item
  @health_maintenance ||= HealthMaintenance.find_by(id: params[:health_maintenance_id])
  end
end
