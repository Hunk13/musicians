class Genre < ActiveRecord::Base
  has_many :musicians
end
