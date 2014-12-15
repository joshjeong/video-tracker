@VideoTracker.module "TrashedApp", (TrashedApp, App, Backbone, Marionette, $, _) ->

  class TrashedApp.Router extends Marionette.AppRouter
    appRoutes: 
      "trashed" : "trashedList"

  API =
    trashedList: ->
      new TrashedApp.List.Controller


  App.addInitializer ->
    new TrashedApp.Router
      controller: API


