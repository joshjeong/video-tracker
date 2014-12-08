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

  def update
    @movie = Movie.find(params[:id])
    if [true, false].include?(params[:watched])
      @movie.update_attributes(watched: params[:watched])
      respond_with @movie
    else
      render nothing: true, status: 304 
    end
  end

end
