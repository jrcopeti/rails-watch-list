class Movie < ApplicationRecord
  validates :title, :overview, presence: true, uniqueness: true
  validates :overview, presence: true
  has_many :bookmarks
end
