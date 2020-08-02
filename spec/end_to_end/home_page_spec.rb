require 'rails_helper'
require_relative '../fixtures/api_responses.rb'
include Fixtures::ApiResponses

RSpec.describe 'Home page', js: true, type: :system do
  context 'index page' do
    it 'shows the right content' do
      expect_any_instance_of(AlbumsService).to receive(:albums_hash_array)
        .and_return(expected_array)
      visit root_path
      expect(page).to have_content('Photo Albums')
      expect(page).to have_content(expected_array.first['title'])
      expect(page).to have_content(expected_array.first['username'])
    end

    it 'navigates to show album page' do
      expect_any_instance_of(AlbumsService).to receive(:albums_hash_array).twice
        .and_return(expected_array)
      visit root_path
      click_link('View Album')
    end
  end
end