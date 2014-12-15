@VideoTracker.module "TrashedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends Marionette.Controller
    initialize: ->
      @trashedList()
      
    trashedList: ->
      App.request "movie:model", (movies) =>

        trashedArray = movies.where(trashed: true)

        trashedMovies = new List.TrashedMovies
        trashedMovies.reset(trashedArray)

        trashedListView = @getTrashedListView trashedMovies
        App.mainRegion.show trashedListView

    getTrashedListView: (movies) ->
        new List.TrashedListCollection         
          collection: movies


