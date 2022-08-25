class List < ApplicationRecord
  # When you delete a list, you should delete all associated bookmarks (but not the movies as they can be referenced in other lists).
  has_many :bookmarks, dependent: :destroy
  # has many movies
  has_many :movies, through: :bookmarks

  validates :name, presence: true
  validates :name, uniqueness: true


end
