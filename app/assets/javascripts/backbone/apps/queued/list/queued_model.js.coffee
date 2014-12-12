@VideoTracker.module "QueuedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.QueuedMovie extends Backbone.Model

  class List.QueuedMovies extends Backbone.Collection
    model: List.QueuedMovie