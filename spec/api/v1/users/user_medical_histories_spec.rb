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
    context "the user and medical history already exist" do
      it "it can create a new user medical history" do
        post "/api/v1/users/#{user.id}/medical_histories/#{medical_history.id}"

        expect(response.status).to eq(201)
        expect(user.medical_histories).to include(medical_history)
      end
    end

    context "the user or medical history does not exist" do
      it "it can create a new user medical history" do
        post "/api/v1/users/50/medical_histories/7"

        expect(response.status).to eq(404)
      end
    end
  end

  describe "#delete" do
    context "the user and medical history already exist" do

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
  context "the user or medical history does not exist" do
    it "it can create a new user medical history" do
      delete "/api/v1/users/5/medical_histories/7"

      expect(response.status).to eq(404)
    end
  end

describe "#update" do

    it "it can update a user's medical history" do
      @medicalhistory_2 = create(:medical_history)
      user.medical_histories << @medicalhistory_2

      patch "/api/v1/users/#{user.id}/medical_histories/#{@medicalhistory_2.id}", params: {:note => "I had this condition during the summer of 2009"}
      user_medical_history = UserMedicalHistory.find_by(user_id: user.id, medical_history_id: @medicalhistory_2.id)

      expect(response).to be_success
      expect(user_medical_history.note).to eq("I had this condition during the summer of 2009")
    end
  end
end
