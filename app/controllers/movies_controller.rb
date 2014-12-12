class MoviesController < ApplicationController
  respond_to :json

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_params)
    respond_with @movie
  end

  private
  def movie_params
    params.require(:movie).permit(:watched, :trashed, :queued)
  end


end
