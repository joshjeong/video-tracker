@VideoTracker.module "TrashedApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =
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


