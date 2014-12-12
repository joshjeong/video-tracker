@VideoTracker.module "TrashedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.TrashedMovie extends Backbone.Model

  class List.TrashedMovies extends Backbone.Collection
    model: List.TrashedMovie