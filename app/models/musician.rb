class Musician < ActiveRecord::Base
  belongs_to :genre
  belongs_to :user

  validates :name, presence: true
end
