require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the registration page' do
    it 'I am able to enter my credentials and create an account' do
      visit '/registration'

      fill_in :name, with: 'Testname'
      fill_in :email, with: 'test@email.com'
      fill_in :password, with: 'testpassword'
      fill_in :password_confirmation, with: 'testpassword'

      click_button 'Register'
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Testname')
    end

    it 'I see a link to log-in and when I click that link I am redirected to
    the welcome page' do
      visit '/registration'

      click_link 'Already Registered? Log in Here'
      expect(current_path).to eq('/')
    end
  end
end
