class MoviesController < ApplicationController
  respond_to :json

  def index
    @movies = Movie.all
    p @movies
    respond_with @movies  
  end
end
