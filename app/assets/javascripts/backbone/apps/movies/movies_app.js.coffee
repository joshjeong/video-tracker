@VideoTracker.module "MoviesApp", (MoviesApp, App, Backbone, Marionette, $, _) ->

  class MoviesApp.Router extends Marionette.AppRouter
    appRoutes:
      "movies" : "listMovies"

  API =
    new MoviesApp.List.Controller      

  App.addInitializer ->
    new MoviesApp.Router
      controller: API