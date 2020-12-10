require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the welcome page' do
    before :each do
      @garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
    end
    it 'I am able to enter my credentials and login to my account', :vcr do
      visit '/'

      expect(page).to have_link('New to Viewing Party? Register Here')
      expect(page).to have_content('Viewing Party is a movie watch-party coordination service.')

      fill_in :email, with: 'garrett.cottrell'
      fill_in :password, with: '1234'

      click_button 'Sign in'
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Welcome Garrett')
    end

    it 'If I enter an invalid email address, I am redirected back to the welcome page with an error message', :vcr do
      visit '/'

      fill_in :email, with: 'nick@night.com'
      fill_in :password, with: '1234'

      click_button 'Sign in'
      expect(current_path).to eq(welcome_path)
      expect(page).to have_content('Email and/or password is incorrect')
    end

    it 'If I enter an invalid password, I am redirected back to the welcome page with an error message', :vcr do
      visit '/'

      fill_in :email, with: 'garrett.cottrell'
      fill_in :password, with: '4321'

      click_button 'Sign in'
      expect(current_path).to eq(welcome_path)
      expect(page).to have_content('Email and/or password is incorrect')
    end

    it 'I see a link to register and when I click on that link, I am taken to the registration page', :vcr do
      visit '/'

      click_link 'New to Viewing Party? Register Here'
      expect(current_path).to eq('/registration')
    end
  end
end
