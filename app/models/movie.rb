class Movie < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :api_id
end
