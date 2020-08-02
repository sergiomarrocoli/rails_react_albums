require 'rails_helper'

describe ApiService, type: :model do

  context 'API calls' do
    context 'albums' do
      it 'makes a call to the albums/ endpoint' do
        expect(ApiService).to receive(:get).with('/albums').once
        ApiService.new.all_albums 
      end

      it 'makes a call to the albums/album_id/photos endpoint' do
        album_id = 1
        expect(ApiService).to receive(:get).with("/albums/#{album_id}/photos").once
        ApiService.new.photos(album_id) 
      end
    end

    context "users" do
      it 'makes a call to the users/ endpoint' do
        expect(ApiService).to receive(:get).with('/users').once
        ApiService.new.all_users 
      end

      it 'makes a call to the users/user_id endpoint' do
        user_id = 1
        expect(ApiService).to receive(:get).with("/users/#{user_id}").once
        ApiService.new.user(user_id) 
      end
    end

    it 'makes a call to the photos/ endpoint' do
      expect(ApiService).to receive(:get).with('/photos').once
      ApiService.new.all_photos 
    end
  end
end