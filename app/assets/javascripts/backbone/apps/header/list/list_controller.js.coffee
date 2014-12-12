@VideoTracker.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->


  List.Controller = 
    listHeader: ->
      links = App.request "links:model"

      headerView = @getHeaderView links

      App.headerRegion.show headerView

    getHeaderView: (links) ->
      new List.HeaderViewCollection
        collection: links