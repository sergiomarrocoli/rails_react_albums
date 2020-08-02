require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do

  context 'show' do
    it 'returns data for a single user' do
      user_id = 1
      expect_any_instance_of(ApiService)
      .to receive(:user).with(user_id).once
      .and_return("user_hash")

      expect_any_instance_of(UserMapper)
      .to receive(:user_hash).with("user_hash").once
      .and_return("simple_user_hash")

      get("/api/v1/users/#{user_id}")
      expect(response.status).to eq(200)
      expect(response.body).to eq "simple_user_hash"
    end
  end
end
