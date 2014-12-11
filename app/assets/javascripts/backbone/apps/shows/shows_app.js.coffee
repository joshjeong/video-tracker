@VideoTracker.module "ShowsApp", (ShowsApp, App, Backbone, Marionette, $, _) ->

  class ShowsApp.Router extends Marionette.AppRouter
    appRoutes:
      "shows" : "listShows"

  API = 
    listShows: ->
      ShowsApp.List.Controller.listShows()

  App.addInitializer ->
    new ShowsApp.Router
      controller: API