class Activity < ApplicationRecord
  has_many :signups
  has_many :campers, through: :signups
  validates :difficulty, :name, presence: true
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
