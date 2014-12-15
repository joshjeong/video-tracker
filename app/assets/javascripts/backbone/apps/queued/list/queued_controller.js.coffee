@VideoTracker.module "QueuedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends Marionette.Controller
    initialize: ->
      @getQueuedList()

    getQueuedList: ->
      # get from db
      App.request "movie:model", (movies) =>
        
        queuedArray = movies.where(queued: true)
      # create collection
        queuedMovies = new List.QueuedMovies
      # reset to convert array to collection object
        queuedMovies.reset(queuedArray)

      #pass to view
        queuedListView = @getQueuedListView queuedMovies

      #show

        App.mainRegion.show queuedListView

    getQueuedListView: (queuedMovies)->
      new List.QueuedListView
        collection: queuedMovies

