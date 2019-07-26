require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { build :note }

  it "has a valid note" do
    expect(subject).to be_valid
  end

  describe 'Validations' do 
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:note) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
  end
end
