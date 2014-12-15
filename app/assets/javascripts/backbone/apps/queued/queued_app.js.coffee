@VideoTracker.module "QueuedApp", (QueuedApp, App, Backbone, Marionette, $, _) ->

  class QueuedApp.Router extends Marionette.AppRouter
    appRoutes:
      "queued" : "queuedList"

  API = 
    queuedList: ->
      new QueuedApp.List.Controller


  App.addInitializer ->
    new QueuedApp.Router
      controller: API