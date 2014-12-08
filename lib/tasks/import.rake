desc "import movie data from themoviedb"
task :import => :environment do
  Tmdb::Api.key(ENV["API_KEY"])
  in_theatres = Tmdb::Movie.now_playing

  in_theatres.each do |movie|
    title = movie.title
    if movie.poster_path
      image = "http://image.tmdb.org/t/p/w780/#{movie.poster_path}"
    else
      image = "http://www.uwplatt.edu/files/styles/high_resolution/public/image_fields/directory_image/image-not-available_14.jpg"
    end
    release_date = movie.release_date
    link = "http://www.themoviedb.org/movie/#{movie.id}"
    Movie.create(title: title, image: image, release_date: release_date, link: link, watched: false)
  end
end