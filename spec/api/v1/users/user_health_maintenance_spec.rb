require 'rails_helper'

RSpec.describe 'user health maintenance API' do
  
  let!(:user) {create(:user_with_health_maintenance)}
  let!(:health_maintenance) {create(:health_maintenance)}


  describe "#index" do

    it "returns a list of all user's health_maintenance activities" do

      get "/api/v1/users/#{user.id}/health_maintenances"

      health_maintenance = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(health_maintenance.first["name"]).to eq(user.health_maintenances.first.name)
    end
  end
  describe "#create" do
    context "the user and health_maintenance that already exist" do
      it "it can create a new user health_maintenance record" do
        post "/api/v1/users/#{user.id}/health_maintenances/#{health_maintenance.id}"

        expect(response.status).to eq(201)
        expect(user.health_maintenances).to include(health_maintenance)
      end
    end

    context "the user or health_maintenance does not exist" do
      it "it cannot create a new user health maintenance record" do
        post "/api/v1/users/50/health_maintenances/400"

        expect(response.status).to eq(404)
      end
    end
  end

  describe "#delete" do
    context "the user and health_maintenance already exist" do

      it "it can delete a user's health_maintenance" do
        @health_maintenance_2 = create(:health_maintenance)
        user.health_maintenances << @health_maintenance_2
        delete "/api/v1/users/#{user.id}/health_maintenances/#{@health_maintenance_2.id}"

        user.reload
        expect(response.status).to eq(200)
        expect(user.health_maintenances).to_not include(@health_maintenance_2)
      end
    end
  end
  context "the user or family history does not exist" do
    it "it cannot delete a new user health maintenance" do
      delete "/api/v1/users/5/health_maintenances/70"

      expect(response.status).to eq(404)
    end
  end

  describe "#update" do

    it "it can update a user's health_maintenance record" do
      @health_maintenance_2 = create(:health_maintenance)
      user.health_maintenances << @health_maintenance_2

      patch "/api/v1/users/#{user.id}/health_maintenances/#{@health_maintenance_2.id}", params: {:note => "I had this condition during the summer of 2009"}
      user_health_maintenance = UserHealthMaintenance.find_by(user_id: user.id, health_maintenance_id: @health_maintenance_2.id)

      expect(response).to be_success
      expect(user_health_maintenance.note).to eq("I had this condition during the summer of 2009")
    end
  end
end
