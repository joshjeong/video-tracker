@VideoTracker.module "WatchedApp", (WatchedApp, App, Backbone, Marionette, $, _) ->

  class WatchedApp.Router extends Marionette.AppRouter
    appRoutes:
      "watched" : "listWatched"

  API = 
    listWatched: ->
      WatchedApp.List.Controller.listWatched()

  App.addInitializer ->
    new WatchedApp.Router
      controller: API