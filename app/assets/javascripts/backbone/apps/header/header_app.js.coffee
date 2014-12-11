@VideoTracker.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API = 
    showList: ->
      HeaderApp.List.Controller.showList()

  # HeaderApp.on "start", ->
    # API.showList()

