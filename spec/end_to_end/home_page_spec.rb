require 'rails_helper'
require_relative '../fixtures/api_responses.rb'
include Fixtures::ApiResponses

RSpec.describe 'Home page', js: true, type: :system do

  let(:album) { expected_array.first }
  let(:user) { users_response.first }
  let(:photo) { photos_response.first }

  context 'index page' do
    it 'shows the right content' do
      visit root_path

      expect(page).to have_content('Photo Albums')
      expect(page).to have_content(album['title'])
      expect(page).to have_link(album['username'], :href => "/users/1")
      expect(page).to have_link('View Album', :href => "/albums/1?user_id=1")   
    end

    it 'displays the show album page' do
      visit root_path
      first('.card').click_link('View Album')
    
      expect(page).to have_current_path('/albums/1?user_id=1')
      expect(page).to have_link('Home', :href => "/")
      expect(page).to have_link(album['username'], :href => "/users/1")

      address = user['address']
      expect(page).to have_content(address['street'])
      expect(page).to have_content(address['suite'])
      expect(page).to have_content(address['city'])
      expect(page).to have_content(address['zipcode'])
      expect(page).to have_content(photo['title'])
    end

    it 'navigates to show user page' do
      visit root_path
      first('.card').click_link(album['username'])
      expect(page).to have_current_path('/users/1')
      expect(page).to have_link('Home', :href => "/")

      expect(page).to have_content("Albums")
      expect(page).to have_content(album['title'])

      expect(page).to have_content(user['name'])
      expect(page).to have_content(user['username'])
      expect(page).to have_content(user['email'])
      expect(page).to have_content(user['phone'])
      expect(page).to have_content(user['website'])

      address = user['address']
      expect(page).to have_content(address['street'])
      expect(page).to have_content(address['suite'])
      expect(page).to have_content(address['city'])
      expect(page).to have_content(address['zipcode'])

      company = user['company']
      expect(page).to have_content(company['name'])
      expect(page).to have_content(company['catchphrase'])
      expect(page).to have_content(company['bs'])

      expect(page).to have_css '.map'
    end
  end
end