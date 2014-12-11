class ShowsController < ApplicationController
respond_to :json

  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if [true, false].include?(params[:watched])
      @show.update_attributes(watched: params[:watched])
      respond_with @show
    else
      render nothing: true, status: 304 
    end
  end
end
