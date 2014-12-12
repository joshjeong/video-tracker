@VideoTracker.module "QueuedApp.List", (List, App, Backbone, Marionette, $, _) ->
  List.Controller =
    getQueuedList: ->
      # get from db
      App.request "movie:model", (movies) =>
        
        queuedArray = movies.where(queued: true)
      # create collection
        queuedMovies = new List.QueuedMovies
      # reset to convert array to collection object
        queuedMovies.reset(queuedArray)
        console.log queuedMovies

      #pass to view
        queuedListView = @getQueuedListView queuedMovies

      #show

        App.mainRegion.show queuedListView

    getQueuedListView: (queuedMovies)->
      new List.QueuedListView
        collection: queuedMovies