class Api::V1::Users::FamilyHistoriesController < ApplicationController
before_action :find_user
before_action :find_family_history_item, only: [:create,  :destroy, :update]


  def index
    render json: @user.family_histories
  end

def create
    if @user && @familyhistory
      @user.family_histories << @familyhistory
      response = {
        data: {
          redcord_id: UserFamilyHistory.find_by(user_id: @user.id, family_history_id: @familyhistory.id).id,
          id: @familyhistory.id,
          name: @familyhistory.name,
          user: {
            id: @user.id,
          },
          note: {
            note: UserFamilyHistory.find_by(user_id: @user.id, family_history_id: @familyhistory.id).note
          },
        }
      }
      render json: response.merge({ message: "Successfully added #{@familyhistory.name} to #{@user.email}"}), status: 201
   else
      render json: { message: "Cannot find requested family history and/or user" }, status: 404
    end
end

  def update
    record = UserFamilyHistory.find_by(user_id: @user.id, family_history_id: @familyhistory.id)
    if record.update(note: params[:note])

      response = {
        data: {
          id: @familyhistory.id,
          name: @familyhistory.name,
          user: {
            id: @user.id,
          },
          note: {
            note: record.note
          },
        }
      }
      render json: response.merge({ message: "Successfully updated #{@familyhistory.name} to #{@user.email}"}), status: 201
    else
      render json: record.errors, status: 400
    end
  end

def destroy
  if @user && @familyhistory
    record = UserFamilyHistory.find_by(user_id: @user.id, family_history_id: @familyhistory.id)
    record.destroy

    render json: { message: "Successfully removed #{@familyhistory.name} from #{@user.email}"}, status: 200
  else
    render json: { message: "Cannot find requested user of family condition to delete" }, status: 404
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
