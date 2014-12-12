@VideoTracker.module "WatchedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WatchedMovie extends Backbone.Model


  class List.WatchedMovies extends Backbone.Collection
    model: List.WatchedMovie