desc "import movie data from themoviedb"
task :import => :environment do
  Tmdb::Api.key(ENV["API_KEY"])
  in_theatres = Tmdb::Movie.now_playing

  in_theatres.each do |movie|
    title = movie.title
    image = "http://image.tmdb.org/t/p/w780/#{movie.poster_path}"
    release_date = movie.release_date
    link = "http://www.themoviedb.org/movie/#{movie.id}"
    Movie.create(title: title, image: image, release_date: release_date, link: link, watched: false)
  end
end
