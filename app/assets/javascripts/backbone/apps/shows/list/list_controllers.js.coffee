@VideoTracker.module "ShowsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends Marionette.Controller
    initialize: ->
      App.request "show:model", (shows) =>

        @layout = @getLayout()

        @layout.on 'show', =>
          @showPanel shows
          @showShows shows

        App.mainRegion.show @layout

    getLayout: ->
      new List.Layout   

    showPanel: (shows) ->
      panelView = @getPanelView shows
      @layout.panelRegion.show panelView

    showShows: (shows) ->
      showCollectionView = @getShows shows
      @layout.showsRegion.show showCollectionView

    getShows: (shows) ->
      new List.ShowCollectionView
        collection: shows

    getPanelView: (shows) ->
      new List.PanelView
        collection: shows   


