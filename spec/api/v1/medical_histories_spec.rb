require 'rails_helper'

RSpec.describe 'health histories API' do

  let!(:MedicalHistories )   { create_list(:medical_history , 10) }

  it "sends a list of medical_histories" do

    get '/api/v1/medical_histories'

    expect(response).to be_success
    medical_histories = JSON.parse(response.body)
    expect(medical_histories.count).to eq(10)

  end
end
