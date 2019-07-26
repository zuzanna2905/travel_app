require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  it "is valid" do
    expect(user).to be_valid
  end

  describe 'Validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'Associations' do
    it { should have_many(:notes) }
    it "should remove notes after remove user" do
      create(:note, user_id: user.id)
      expect { user.destroy }.to change { Note.count }.by(-1)
    end
  end
end
