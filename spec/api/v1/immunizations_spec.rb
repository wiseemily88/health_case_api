require 'rails_helper'

RSpec.describe 'immunizations API' do

  let!(:immunizations )   { create_list(:immunization , 10) }

  it "sends a list of family_histories" do

    get '/api/v1/immunizations'

    expect(response).to be_success
    immunizations = JSON.parse(response.body)
    expect(immunizations.count).to eq(10)

  end
end
