class Movie < ActiveRecord::Base
  validates_uniqueness_of :link
end
