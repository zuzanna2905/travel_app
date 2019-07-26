require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let!(:user) { create(:user) }
  describe 'Signin in correctly' do
    it 'signed in by correct data' do  
      visit root_path
      click_on 'Log in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      expect(page).to have_content 'Add new note'
    end

    it 'signed in by incorrect data' do
      visit root_path
      click_on 'Log in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password+'12'
      click_button 'Log in'
      expect(page).to have_content 'Log in'
    end
  end
end
