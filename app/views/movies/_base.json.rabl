attributes :id, :title, :image, :release_date, :link, :watched, :overview, :rating, :queued, :trashed, :created_at, :updated_at

node do |movie|
  {
    :release_date_formatted => time_ago_in_words(movie.release_date)
  }
end