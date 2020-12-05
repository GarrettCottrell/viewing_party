require 'rails_helper'

  describe "When I visit '/dashboard'" do
    describe 'As an authenticated user' do
    before :each do
      @garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@garrett)
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
      shawshank = Movie.create(name: 'Shawshank Redemption', api_id: 1337)
      viewing_party_one = Event.create!(movie_id: shawshank.id,
                                        date: '12/5/2020',
                                        start_time: '12:00',
                                        duration: "90")

      UserEvent.create!(user_id: @garrett.id,
                        event_id: viewing_party_one.id,
                        status: 'Invited')
      visit dashboard_index_path
      expect(page).to have_content(viewing_party_one.movie.name)
      expect(page).to have_content(viewing_party_one.date)
      expect(page).to have_content(viewing_party_one.start_time)
      expect(page).to have_content('Invited')
    end

    it 'I see movie title, date and time and status of hosting for all of
    the viewing parties that I am hosting' do
      shawshank = Movie.create(name: 'Shawshank Redemption', api_id: 1337)
      viewing_party_one = Event.create!(movie_id: shawshank.id,
                                        date: '12/5/2020',
                                        start_time: '12:00',
                                        duration: "90")

      UserEvent.create!(user_id: @garrett.id,
                        event_id: viewing_party_one.id,
                        status: 'Hosting')
      visit dashboard_index_path
      expect(page).to have_content(viewing_party_one.movie.name)
      expect(page).to have_content(viewing_party_one.date)
      expect(page).to have_content(viewing_party_one.start_time)
      expect(page).to have_content('Hosting')
    end
  end

  describe 'As a guest' do
    it 'I see a link to register' do
      visit '/dashboard'
      expect(page).to have_link('Register')
    end
  end
end
