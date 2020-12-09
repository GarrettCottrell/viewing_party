require 'rails_helper'

describe 'movie index page' do
  it 'top rated button discover index', :vcr do
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
    expect(page).to have_css('.movie-39')
    expect(page).to_not have_css('.movie-40')
  end

  it 'user clicks movie', :vcr do
    garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)
    visit '/discover' #use path here
    click_button 'Find Top Rated Movies'
    expect(current_path).to eq('/movies')
    expect(page).to have_css('.title')
    within '.movie-0' do
      click_link
    end
    expect(current_path).to eq('/movies/761053') #use path helpers for uri paths
  end

  it 'user sees vote averages', :vcr do
    garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)
    visit '/discover'
    click_button 'Find Top Rated Movies'
    expect(current_path).to eq('/movies')
    expect(page).to have_css('.title')
    within '.movie-0' do
     expect(page).to have_content(9.2)
    end
  end

  it 'top rated button movie index', :vcr do
    garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)
    visit '/discover'
    click_button 'Find Top Rated Movies'
    expect(current_path).to eq('/movies')
    click_button 'Find Top Rated Movies'
    expect(current_path).to eq('/movies')
     within '.movie-0' do
      title = find('.title').text
      expect(title).to_not be_empty
    end
  end

  it 'user searches for movie by title', :vcr do
    garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)
    visit '/discover'

    fill_in :Search_By_Movie_Title, with: 'Sunday'
    click_button 'Find Movies'
    expect(current_path).to eq('/movies')
    fill_in :Search_By_Movie_Title, with: 'Sunday'
    expect(current_path).to eq('/movies')
    expect(page).to have_css('.title')
    within '.movie-0' do
      expect(page).to have_content('Sunday')
    end
  end

  it 'user is not authorized', :vcr do
    visit '/movies'
    expect(page).to have_content('Please Register to view this page')
    expect(page).to_not have_css('.title')
  end
end
