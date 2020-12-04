require 'rails_helper'

describe 'As an authenticated user' do
  describe "When I visit '/dashboard'" do
    it 'I should see a welcome message' do
      garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)

      visit '/dashboard'

      expect(page).to have_content('Welcome Garrett!')
    end

    it 'If I am not not an authenticated user, I see a link to register' do
      visit '/dashboard'

      expect(page).to have_link('Register')
    end

    it "The 'discover movies' button redirects me to '/discover'" do
      garrett = User.create(name: 'Garrett', email: 'garrett.cottrell', password: '1234')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(garrett)

      visit '/dashboard'

      click_button 'Discover Movies'

      expect(current_path).to eq('/discover')
    end

    xit "Friends Section" do

    end

    xit "Viewing Parties" do

    end
  end
end



# As an authenticated user,
# When I visit '/dashboard'
# I should see:
#
#  'Welcome <username>!' at the top of page
 #9 A button to Discover Movies
 #10 A friends section
 #11 A viewing parties section
