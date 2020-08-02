require 'rails_helper'
require_relative '../fixtures/api_responses.rb'
include Fixtures::ApiResponses

describe AlbumsService, type: :model do

  context 'albums_hash' do
    it 'assembles a hash from API responses' do
      expect(ApiService).to receive(:get).with('/albums').and_return(albums_response)
      expect(ApiService).to receive(:get).with('/users').and_return(users_response)
      expect(ApiService).to receive(:get).with('/photos').and_return(photos_response)
      expected_array = [
        {
          "userId"=>1,
          "id"=>1,
          "title"=>"quidem molestiae enim",
          "username"=>"Leanne Graham",
          "thumbnail_url"=>"https://via.placeholder.com/600/92c952"
        }
      ]
      expect(AlbumsService.new.albums_hash_array).to eq expected_array 
    end
  end
end