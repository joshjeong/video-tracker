@VideoTracker.module "WatchedApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller = 
    listWatched: ->
      watchedList = App.request "watched:model"

