require 'rails_helper'

RSpec.describe 'family histories API' do

  let!(:FamilyHistories )   { create_list(:family_history , 10) }

  it "sends a list of family_histories" do

    get '/api/v1/family_histories'

    expect(response).to be_success
    family_histories = JSON.parse(response.body)
    expect(family_histories.count).to eq(10)

  end
end
