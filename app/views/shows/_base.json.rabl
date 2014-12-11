attributes :id, :title, :image, :release_date, :link, :watched, :created_at, :updated_at

node do |shows|
  {
    :release_date_formatted => time_ago_in_words(shows.release_date)
  }
end