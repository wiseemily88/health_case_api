require 'rails_helper'

RSpec.describe 'user medical histories API' do

 let!(:user) {create(:user_with_medical_history)}


  describe "#index" do
    it "returns a list of all user medical histories" do
      get "/api/v1/users/#{user.id}/medical_histories"

      history = JSON.parse(response.body)

      expect(response.status).to eq(200)
      # expect(history.first["name"]).to eq(user.medical_histories.first.name)
    end
  end
end
