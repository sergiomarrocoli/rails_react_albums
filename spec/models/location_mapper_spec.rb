require 'rails_helper'
require_relative '../fixtures/api_responses.rb'
include Fixtures::ApiResponses

describe LocationMapper, type: :model do
  it 'takes a user hash and returns a simple hash with Google API key' do
    location_hash = LocationMapper.new.location_hash(users_response.first)
    expect(location_hash.keys).to match %w(lat lng api_key)
  end
end