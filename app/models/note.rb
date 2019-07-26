class Note < ApplicationRecord
  belongs_to :user
  validates :city, presence: true
  validates :note, presence: true
end
