@VideoTracker.module "MoviesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Movie extends Backbone.Model

  class List.Movies extends Backbone.Collection
    model: List.Movie
    url: Routes.movies_path()


  API = 
    getMovieCollection: (cb) ->
      movies = new List.Movies
      movies.fetch
        success: ->
          cb movies

  App.reqres.setHandler "movie:model", (cb) ->
    API.getMovieCollection cb