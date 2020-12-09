require 'rails_helper'

describe 'When I visit the discover movies page' do
  it 'top rated button', :vcr do
    garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)
    visit '/discover'
    click_button 'Find Top Rated Movies'
    expect(current_path).to eq('/movies')
    expect(page).to have_css('.title')
    within '.movie-0' do
      title = find('.title').text
      expect(title).to_not be_empty
    end
  end

  it 'search functionality', :vcr do
    garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)
    visit '/discover'

    fill_in :Search_By_Movie_Title, with: 'Sunday'
    click_button 'Find Movies'
    expect(current_path).to eq('/movies')
    expect(page).to have_css('.title')
    within '.movie-0' do
      expect(page).to have_content('Sunday')
    end
  end

  it 'sad path unauthorized user', :vcr do
    visit '/discover'
    expect(page).to have_content('Please Register to view this page')
    expect(page).to_not have_css('.title')
  end
end
