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
        post "/api/v1/users/#{user.id}/surgical_histories",  {params: {name: 'knee replacement', date: Date.new, location: 'Maine Medical', physician: "Dr. Who"}}

        expect(response.status).to eq(201)
        expect(SurgicalHistory.last.name).to eq("knee replacement")
        expect(SurgicalHistory.last.location).to eq("Maine Medical")
      end
    end
  end

  describe "#delete" do
    context "the user and surgical history already exist" do

      it "it can delete a user's surgical history" do
        @surgicalhistory_2 = user.surgical_histories.last
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
  

    patch "/api/v1/users/#{user.id}/surgical_histories/#{user.surgical_histories.last.id}", {params: {location: "UTK"} }

      expect(response).to be_success
    end
  end
end
