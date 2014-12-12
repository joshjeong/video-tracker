@VideoTracker.module "WatchedApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller = 
    listWatched: ->
      App.request "movie:model", (movies) =>
        movieList = movies.models

        watchedArray = movies.where(watched: true)

        watchedMovies = new List.WatchedMovies();
        watchedMovies.reset(watchedArray)

        watchedListView = @getWatchedListView watchedMovies
        App.mainRegion.show watchedListView

    getWatchedListView: (movies) ->
        new List.WatchedCollection
          collection: movies
        