require 'rails_helper'
require_relative '../fixtures/api_responses.rb'
include Fixtures::ApiResponses

RSpec.describe 'Home page', js: true, type: :system do

  let(:album) { expected_array.first }

  context 'index page' do
    it 'shows the right content' do
      expect_any_instance_of(AlbumsService).to receive(:albums_hash_array)
        .and_return(expected_array)
      visit root_path

      expect(page).to have_content('Photo Albums')
      expect(page).to have_content(album['title'])
      expect(page).to have_link(album['username'], :href => "/users/1")
      expect(page).to have_link('View Album', :href => "/albums/1?user_id=1")   
    end

    it 'navigates to show album page' do
      allow_any_instance_of(AlbumsService).to receive(:albums_hash_array)
      .and_return(expected_array)
      visit root_path
      first('.card').click_link('View Album')
      expect(page).to have_current_path('/albums/1?user_id=1')
    end

    it 'navigates to show user page' do
      allow_any_instance_of(AlbumsService).to receive(:albums_hash_array)
      .and_return(expected_array)
      visit root_path
      first('.card').click_link(album['username'])
      expect(page).to have_current_path('/users/1')
    end
  end
end