# require 'rails_helper'
#
# RSpec.describe 'user immunization histories API' do
#
#   let!(:user) {create(:user_with_immunization_history)}
#   let!(:immunization) {create(:immunization)}
#
#
#
#   describe "#index" do
#     it "returns a list of all user's immunizations" do
#       get "/api/v1/users/#{user.id}/immunizations"
# 
#       immunization = JSON.parse(response.body)
#
#       expect(response.status).to eq(200)
#       expect(immunization.first["name"]).to eq(user.immunizations.first.name)
#     end
#   end
# end
