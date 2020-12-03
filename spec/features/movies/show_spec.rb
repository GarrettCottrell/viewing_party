require 'rails_helper'

describe 'As an authenticated user' do
  describe 'When I visit a movie detail page' do
    before :each do
      nick = User.create(name: 'Nick', email: 'nick@nick.com', password: '1234')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nick)
    end
    xit 'I see a button to create a viewing party' do
      visit '/movies/761053'

      expect(page).to have_button('Create Viewing Party for Movie')
      # Add click link/path test when this is built out
    end

    it 'I see should movie information including title, average vote, runtime, genre and summary' do
      visit '/movies/278'

      expect(page).to have_content('The Shawshank Redemption')
      expect(page).to have_content('Vote Average: 8.7')
      expect(page).to have_content('Runtime: 2 hr 22 min')
      expect(page).to have_content('Genre(s): Drama, Crime')
      expect(page).to have_content('Framed in the 1940s for the double murder')
    end

    it 'I see the first 10 cast members' do
      within '.cast-0' do
        expect(page).to have_content('Tim Robbins')
      end
      expect(page).to have_css('.cast-9')
      expect(page).not_to have_css('.cast-10')
    end

    it "I see the total count of reviews and each review's author and information" do
      expect(page).to have_content('# Reviews')
      within '.review_result-0' do
        expect(page).to have_content('')
      end
    end
  end
end
