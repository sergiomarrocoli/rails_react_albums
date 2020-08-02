require 'rails_helper'
require_relative '../fixtures/api_responses.rb'
include Fixtures::ApiResponses

describe AlbumsService, type: :model do

  let(:expected_array) {
    [
      {
        "userId"=>1,
        "id"=>1,
        "title"=>"quidem molestiae enim",
        "username"=>"Leanne Graham",
        "thumbnail_url"=>"https://via.placeholder.com/600/92c952"
      }
    ]
  }

  context 'albums_hash_array' do
    it 'assembles an array of hashes from API responses' do
      expect(ApiService).to receive(:get).with('/albums').and_return(albums_response)
      expect(ApiService).to receive(:get).with('/users').and_return(users_response)
      expect(ApiService).to receive(:get).with('/photos').and_return(photos_response)
      expect(AlbumsService.new.albums_hash_array).to eq expected_array 
    end
  end

  context 'albums_hash_array with user param' do
    it 'returns array of albums when user is found' do
      expect(ApiService).to receive(:get).with('/albums').and_return(albums_response)
      expect(ApiService).to receive(:get).with('/users').and_return(users_response)
      expect(ApiService).to receive(:get).with('/photos').and_return(photos_response)
      expect(AlbumsService.new.albums_hash_array(1)).to eq expected_array 
    end

    it 'returns empty array when user is not found' do
      expect(ApiService).to receive(:get).with('/albums').and_return(albums_response)
      expect(ApiService).not_to receive(:get).with('/users')
      expect(ApiService).not_to receive(:get).with('/photos')
      expect(AlbumsService.new.albums_hash_array(2)).to eq [] 
    end
  end
end