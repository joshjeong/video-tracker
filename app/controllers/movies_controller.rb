class MoviesController < ApplicationController
  respond_to :json

  def index
    @movies = Movie.all
    respond_with @movies  
  end

  def show
    @movie = Movie.find(params[:id])
    respond_with @movie
  end
end
