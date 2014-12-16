@VideoTracker.module "TrashedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.TrashedView extends App.Views.ItemView
    template: 'trashed/list/templates/_trashedmovie'
    events: ->
      _.extend {}, App.Views.ItemView::events,
        mouseenter            : 'showOverlay'
        mouseleave            : 'hideOverlay'
        'click .trashed-btn'  : 'toggleTrashed'

  class List.TrashedListCollection extends App.Views.CompositeView
    template: 'trashed/list/templates/_trashedmovies'
    childView: List.TrashedView
