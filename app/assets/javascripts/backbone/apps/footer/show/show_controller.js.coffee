@VideoTracker.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends Marionette.Controller
    initialize: ->
      @showFooter()
      
    showFooter: ->
      footerView = @getFooterView()

      App.footerRegion.show footerView

    getFooterView: ->
      new Show.FooterView