require 'rails_helper'

RSpec.describe 'user surgical histories API' do

  let!(:user) {create(:user_with_surgical_history)}
  let!(:surgical_history) {create(:surgical_history)}



  describe "#index" do
    it "returns a list of all user surgical histories" do
      get "/api/v1/users/#{user.id}/surgical_histories"

      history = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(history.first["name"]).to eq(user.surgical_histories.first.name)
    end
  end

  describe "#create" do
    context "the user and surgical history already exist" do
      it "it can create a new user surgical history" do
        post "/api/v1/users/#{user.id}/surgical_histories/#{surgical_history.id}"

        expect(response.status).to eq(201)
        expect(user.surgical_histories).to include(surgical_history)
      end
    end

    context "the user or surgical history does not exist" do
      it "it cannot create a new user surgical history" do
        post "/api/v1/users/50/medical_histories/70"

        expect(response.status).to eq(404)
      end
    end
  end

  describe "#delete" do
    context "the user and surgical history already exist" do

      it "it can delete a user's surgical history" do
        @surgicalhistory_2 = create(:surgical_history)
        user.surgical_histories << @surgicalhistory_2
        delete "/api/v1/users/#{user.id}/surgical_histories/#{@surgicalhistory_2.id}"

        user.reload
        expect(response.status).to eq(200)
        expect(user.surgical_histories).to_not include(@surgicalhistory_2)
      end
    end
  end
  context "the user or surgical history does not exist" do
    it "it cannot create a new user surgical history" do
      delete "/api/v1/users/5/surgical_histories/70"

      expect(response.status).to eq(404)
    end
  end

describe "#update" do

    it "it can update a user's surgical history" do
      @surgicalhistory_2 = create(:surgical_history)
      user.surgical_histories << @surgicalhistory_2

      patch "/api/v1/users/#{user.id}/surgical_histories/#{@surgicalhistory_2.id}", params: {:note => "I had this condition during the summer of 2009"}
      user_surgical_history = UserSurgicalHistory.find_by(user_id: user.id, surgical_history_id: @surgicalhistory_2.id)

      expect(response).to be_success
      expect(user_surgical_history.note).to eq("I had this condition during the summer of 2009")
    end
  end
end
