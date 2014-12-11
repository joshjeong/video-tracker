@VideoTracker.module "MoviesApp", (MoviesApp, App, Backbone, Marionette, $, _) ->

  class MoviesApp.Router extends Marionette.AppRouter
    appRoutes:
      "movies" : "listMovies"

  API =
    listMovies:->
      MoviesApp.List.Controller.listMovies()

  App.addInitializer ->
    new MoviesApp.Router
      controller: API
    

