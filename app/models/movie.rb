class Movie < ApplicationRecord
   has_many :reviews
   has_one :director
end
