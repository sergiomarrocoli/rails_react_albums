require 'spec_helper'

describe ApiService, type: :model do

  context 'API calls' do
    it 'makes a call to the albums/ endpoint' do
      expect(ApiService).to receive(:get).with('/albums').once
      ApiService.new.all_albums 
    end

    it 'makes a call to the users/ endpoint' do
      expect(ApiService).to receive(:get).with('/users').once
      ApiService.new.all_users 
    end

    it 'makes a call to the photos/ endpoint' do
      expect(ApiService).to receive(:get).with('/photos').once
      ApiService.new.all_photos 
    end
  end
end