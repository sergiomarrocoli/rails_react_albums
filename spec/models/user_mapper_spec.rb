require 'rails_helper'
require_relative '../fixtures/api_responses.rb'
include Fixtures::ApiResponses

describe UserMapper, type: :model do
  it 'takes a user hash and returns a simple hash' do
    simple_hash = UserMapper.new.user_hash(users_response.first)
    expect(simple_hash.keys).to match(
      %w(name username email address phone website company_name catch_phrase bs)
    )
  end
end