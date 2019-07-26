class Note < ApplicationRecord
  belongs_to :user
  validates :city, presence: true, length: { minimum: 2 }
  validates :note, presence: true
end
