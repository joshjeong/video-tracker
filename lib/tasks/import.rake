namespace :import do
  desc "import movies now in theatres from themoviedb"
  task :movies => :environment do
    Tmdb::Api.key(ENV["API_KEY"])
    in_theatres = Tmdb::Movie.now_playing

    in_theatres.each do |movie|

      details       = Tmdb::Movie.detail(movie.id)
      title         = movie.title
      release_date  = movie.release_date
      link          = "http://www.themoviedb.org/movie/#{movie.id}"
      rating        = movie.vote_average
      overview      = Tmdb::Movie.detail(movie.id).overview

      if movie.poster_path
        image = "http://image.tmdb.org/t/p/w780/#{movie.poster_path}"
      else
        image = "http://www.uwplatt.edu/files/styles/high_resolution/public/image_fields/directory_image/image-not-available_14.jpg"
      end

      parameters = {
        title:          title, 
        release_date:   release_date, 
        link:           link, 
        rating:         rating, 
        overview:       overview,
        image:          image 
      }

      Movie.create(parameters)
    end
  end


  desc "import most popular tv shows from themoviedb"
  task :shows => :environment do
    Tmdb::Api.key(ENV["API_KEY"])
    popular_shows = Tmdb::TV.popular
      
    popular_shows.each do |show|
      title   = show.name
      link    = "http://www.themoviedb.org/tv/#{show.id}"
      if show.poster_path
        image = "http://image.tmdb.org/t/p/w780/#{show.poster_path}"
      else
        image = "http://www.uwplatt.edu/files/styles/high_resolution/public/image_fields/directory_image/image-not-available_14.jpg"
      end
      release_date = show.first_air_date

      parameters = {
        title: title,
        image: image,
        release_date: release_date,
        link: link
      }

      Show.create(parameters)
    end
  end
end