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

  describe "#create" do
    it "user can add a new prescription" do

      post "/api/v1/users/#{user.id}/prescriptions", {params: {name: 'humira', dosage: '100mm', frequency: 'monthly'}}

      expect(response.status).to eq(200)
      expect(Prescription.last.name).to eq("humira")
      expect(Prescription.last.dosage).to eq("100mm")
      expect(Prescription.last.frequency).to eq("monthly")
    end
  end
  context "invalid attributes" do
    it "fails to create the prescription without a name, freqency, or dosage" do
      post "/api/v1/users/#{user.id}/prescriptions", {params: { dosage: '100mm', frequency: 'monthly'}}

      json = JSON.parse(response.body)
      expect(response.status).to eq(400)
      expect(json["name"].first).to eq("can't be blank")

      post "/api/v1/users/#{user.id}/prescriptions", {params: { dosage: '100mm', name: 'humira'}}

      json = JSON.parse(response.body)
      expect(response.status).to eq(400)
      expect(json["frequency"].first).to eq("can't be blank")

      post "/api/v1/users/#{user.id}/prescriptions", {params: { name: 'humira', frequency: 'monthly'}}

      json = JSON.parse(response.body)
      expect(response.status).to eq(400)
      expect(json["dosage"].first).to eq("can't be blank")
    end
  end

  describe "#update" do
    it "user can update an existing prescription" do
      prescription = user.prescriptions.last

      patch "/api/v1/users/#{user.id}/prescriptions/#{prescription.id}", {params: {note: "I don't feel great taking this", frequency: 'weekly'}}

      user.reload
      expect(response.status).to eq(200)
      expect(prescription.frequency).to eq("weekly")

    end
  end
end
