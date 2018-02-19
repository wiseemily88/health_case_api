require 'rails_helper'

RSpec.describe 'surgical histories API' do

  let!(:SurgicalHistories )   { create_list(:surgical_history , 10) }

  it "sends a list of surgical_histories" do

    get '/api/v1/surgical_histories'

    expect(response).to be_success
    surgical_histories = JSON.parse(response.body)
    expect(surgical_histories.count).to eq(10)

  end
end
