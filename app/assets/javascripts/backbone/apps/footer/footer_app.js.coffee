@VideoTracker.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API = 
    showFooter: ->
      new FooterApp.Show.Controller

  FooterApp.on 'start', ->
    API.showFooter()