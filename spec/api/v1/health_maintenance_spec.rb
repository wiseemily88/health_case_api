require 'rails_helper'

RSpec.describe 'health maintenance API' do

  let!(:health_maintenance )   { create_list(:health_maintenance , 10) }

  it "sends a list of health maintenance" do

    get '/api/v1/health_maintenances'

    expect(response).to be_success
    health_maintenances = JSON.parse(response.body)
    expect(health_maintenances.count).to eq(10)

  end
end
