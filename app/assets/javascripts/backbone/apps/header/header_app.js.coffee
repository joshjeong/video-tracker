@VideoTracker.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API = 
    listHeader: ->
      new HeaderApp.List.Controller



  HeaderApp.on "start", ->
    API.listHeader()

