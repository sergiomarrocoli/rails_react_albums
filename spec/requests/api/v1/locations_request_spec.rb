require 'rails_helper'

RSpec.describe "Api::V1::Locations", type: :request do
  context 'location' do
    it 'returns location data for a single user' do
      user_id = 1
      expect_any_instance_of(ApiService)
      .to receive(:user).with(user_id).once
      .and_return("user_hash")

      expect_any_instance_of(LocationMapper)
      .to receive(:location_hash).with("user_hash").once
      .and_return("location_hash")

      get("/api/v1/users/#{user_id}/location")
      expect(response.status).to eq(200)
      expect(response.body).to eq "location_hash"
    end
  end
end
