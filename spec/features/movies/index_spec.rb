require 'rails_helper'

describe 'As an authenticated user' do
  describe 'When I visit the movies page' do

    it 'I see the 40 results from my search and I can click on each link' do
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

    it 'Each result is a link and when I click on that link, I am taken to the
    show page for that movie' do
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

    it 'Each movie has the vote average associated with it on the page' do
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

    it 'I see button to discover top 40 movies and when I click this button
    the page is refreshed and I see the top 40 top rated movies' do
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

    it 'I see a text field where I can enter a movie title and a button to
    find movies and when I click this button, the page is refreshed
    and see a maximum of 40 movies that include the keyword I entered' do
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

    it 'If I am not logged in, I am shown a link to register in order to view
    the content' do
      visit '/movies'
      expect(page).to have_content('Please Register to view this page')
      expect(page).to_not have_css('.title')
    end
  end
end
