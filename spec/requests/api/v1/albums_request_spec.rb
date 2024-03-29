require 'rails_helper'

RSpec.describe "Api::V1::Albums", type: :request do

  context 'index' do
    it 'returns an array of albums' do
      expect_any_instance_of(AlbumsService)
        .to receive(:albums_hash_array).once
        .and_return("albums_hash_array")
      
      get("/api/v1/albums")
      expect(response.status).to eq(200)
      expect(response.body).to eq "albums_hash_array"   
    end

    context 'nested under user' do
      it 'returns albums for one user' do
        expect_any_instance_of(AlbumsService)
        .to receive(:albums_hash_array).once
        .and_return("albums_hash_array")
      
        get("/api/v1/users/1/albums")
        expect(response.status).to eq(200)
        expect(response.body).to eq "albums_hash_array" 
      end
    end
  end

  context 'show' do
    it 'returns data for a single album' do
      album_id = "1"
      expect_any_instance_of(ApiService)
      .to receive(:photos).with(album_id).once
      .and_return("albums_hash_array")

      get("/api/v1/albums/#{album_id}")
      expect(response.status).to eq(200)
      expect(response.body).to eq "albums_hash_array"
    end
  end
end
