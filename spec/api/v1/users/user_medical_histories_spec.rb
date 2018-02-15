require 'rails_helper'

RSpec.describe 'user medical histories API' do

  let!(:user) {create(:user_with_medical_history)}
  let!(:medical_history) {create(:medical_history)}



  describe "#index" do
    it "returns a list of all user medical histories" do
      get "/api/v1/users/#{user.id}/medical_histories"

      history = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(history.first["name"]).to eq(user.medical_histories.first.name)
    end
  end

  describe "#create" do
    it "it can create a new user medical history" do
      post "/api/v1/users/#{user.id}/medical_histories/#{medical_history.id}"

      expect(response.status).to eq(201)
      expect(user.medical_histories).to include(medical_history)
    end
  end

  describe "#delete" do

    it "it can delete a user's medical history" do
      @medicalhistory_2 = create(:medical_history)
      user.medical_histories << @medicalhistory_2
      delete "/api/v1/users/#{user.id}/medical_histories/#{@medicalhistory_2.id}"

      user.reload
      expect(response.status).to eq(200)
      expect(user.medical_histories).to_not include(@medicalhistory_2)
    end
  end
end
