class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # comment cannot be shorter than 6 characters
  validates :comment, length: { minimum: 6 }
  # is unique for a given movie/list couple
  # combination of a list_id and movie_id must be unique
  validates :list_id, uniqueness: { scope: :movie_id }
end
