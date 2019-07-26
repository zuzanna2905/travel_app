require 'rails_helper'

RSpec.feature "Notes", type: :feature do

  let(:user) { create :user }
  let!(:note) { create :note, user: user }
  let(:note2) { create :note, user: user }

  before(:each) do
    visit root_path
    click_on 'Log in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  it 'show index notes page ' do
    expect(page).to have_content 'Add new note'
    expect(page).to have_content(user.notes.last.city)
  end

  it 'add note' do
    click_on 'Add new note'
    fill_in 'note_city', with: note.city
    fill_in 'note_note', with: note.note
    click_on 'Save' 
    expect(page).to have_content(note.city)
    expect(page).to have_content(note.note)
  end

  it 'delete note' do
    click_on 'Delete'
    expect(page).not_to have_content(note.city)
  end

  it 'edit note' do
    click_on 'Edit'
    fill_in 'note_note', with: note2.note
    click_on 'Save'
    expect(page).to have_content(note2.note)
  end

  it 'show note' do
    click_on 'Show'
    expect(page).not_to have_content 'Add new note'
  end
end
