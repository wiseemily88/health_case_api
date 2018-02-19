require 'rails_helper'

RSpec.describe 'user immunization histories API' do

  let!(:user) {create(:user_with_immunization_history)}
  let!(:immunization) {create(:immunization)}


  describe "#index" do

    it "returns a list of all user's immunizations" do

      get "/api/v1/users/#{user.id}/immunizations"

      immunization = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(immunization.first["name"]).to eq(user.immunizations.first.name)
    end
  end

  describe "#create" do
    context "the user and a new immunization if it already exist" do
      it "it can create a new immunization record" do
        post "/api/v1/users/#{user.id}/immunizations/#{immunization.id}"

        expect(response.status).to eq(201)
        expect(user.immunizations).to include(immunization)
      end
    end

    context "the user or immunization does not exist" do
      it "it cannot create a new immunization record" do
        post "/api/v1/users/50/medical_histories/70"

        expect(response.status).to eq(404)
      end
    end
  end

  describe "#delete" do
    context "if the user and immunization already exist" do

      it "it can delete a user's immunization history" do
        @immunization_2 = create(:immunization)
        user.immunizations << @immunization_2
        delete "/api/v1/users/#{user.id}/immunizations/#{@immunization_2.id}"

        user.reload
        expect(response.status).to eq(200)
        expect(user.medical_histories).to_not include(@immunization_2)
      end
    end
  end
  context "the user or an immunization does not exist" do
    it "it cannot create a new user immunization history" do
      delete "/api/v1/users/5/immunizations/70"

      expect(response.status).to eq(404)
    end
  end

describe "#update" do

    it "it can update a user's immunization history" do
      @immunization_2 = create(:immunization)
      user.immunizations << @immunization_2

      patch "/api/v1/users/#{user.id}/immunizations/#{@immunization_2.id}", params: {:note => "I had this condition during the summer of 2009"}
      user_immunization_history = UserImmunizationHistory.find_by(user_id: user.id, immunization_id: @immunization_2.id)

      expect(response).to be_success
      expect(user_immunization_history.note).to eq("I had this condition during the summer of 2009")
    end
  end
end
