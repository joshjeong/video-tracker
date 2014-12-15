@VideoTracker.module "ShowsApp", (ShowsApp, App, Backbone, Marionette, $, _) ->

  class ShowsApp.Router extends Marionette.AppRouter
    appRoutes:
      "shows" : "listShows"

  API = 
    listShows: ->
      new ShowsApp.List.Controller

  App.addInitializer ->
    new ShowsApp.Router
      controller: API