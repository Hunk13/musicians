class Musician < ActiveRecord::Base
  self.per_page = 4
  belongs_to :genre
  belongs_to :user

  validates :name, presence: true
end
