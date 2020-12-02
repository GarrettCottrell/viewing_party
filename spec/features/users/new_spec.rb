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
      expect(page).to have_content('test@email.com')
    end
  end
end
