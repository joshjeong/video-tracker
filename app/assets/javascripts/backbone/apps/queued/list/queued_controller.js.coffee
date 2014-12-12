@VideoTracker.module "QueuedApp.List", (List, App, Backbone, Marionette, $, _) ->
  List.Controller =
    getQueuedList: ->
      # get from model
      movies = App.request "movie:model"
      console.log movies
      # queudMoviesArray = movies.where(queued: true)
      #pass to view

      #show