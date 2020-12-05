require 'rails_helper'

describe 'As an authenticated user' do
  describe "When I visit '/dashboard'" do
    it 'If I am not not an authenticated user, I see a link to register' do
      visit '/dashboard'
      expect(page).to have_link('Register')
    end

    before :each do 
      garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)
    end

    it 'I should see a welcome message' do
      visit '/dashboard'

      expect(page).to have_content('Welcome Garrett!')
    end

    it "The 'discover movies' button redirects me to '/discover'" do
      visit '/dashboard'
      click_button 'Discover Movies'
      expect(current_path).to eq('/discover')
    end

    xit 'Friends Section' do
    end

    it 'I see movie title, date and time and status of invited for all of
    the viewing parties that I am invited to' do
      shawshank = Movie.create(movie_title: 'Shawshank Redemption' )
      viewing_party_one = ViewingParty.create!(movie_id: 'Shawshank Redemption', date_and_time: 12/5/2020,  )
      visit dashboard_index_path
      expect(page).to have_content(viewing_party_one.movie_title)
      expect(page).to have_content(viewing_party_one.date_and_time)
      expect(page).to have_content('Invited')
    end
  end
end
