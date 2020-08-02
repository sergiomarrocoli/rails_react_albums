require 'rails_helper'

RSpec.describe "Api::V1::Albums", type: :request do

  context 'index' do
    it 'returns an array of albums' do
      expect_any_instance_of(AlbumsService).to receive(:albums_hash_array).once
      get("/api/v1/albums")
      expect(response.status).to eq(200)   
    end
  end
end
