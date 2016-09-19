class Musician < ActiveRecord::Base
  validates :name, presence: true

end
