require 'rails_helper'

RSpec.describe 'user prescription API' do

  let!(:user) {create(:user_with_prescriptions)}
  describe "#index" do
    it "returns a list of all user prescriptions" do
      get "/api/v1/users/#{user.id}/prescriptions"

      history = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(history.first["name"]).to eq(user.prescriptions.first.name)
      expect(history.first["frequency"]).to eq(user.prescriptions.first.frequency)
      expect(history.first["dosage"]).to eq(user.prescriptions.first.dosage)
    end
  end
end
