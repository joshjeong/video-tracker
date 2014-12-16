@VideoTracker.module "QueuedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.QueuedMovieView extends App.Views.ItemView
    template: 'queued/list/templates/queuedmovie'
    events: ->
      _.extend {}, App.Views.ItemView::events,
        mouseenter          : 'showOverlay'
        mouseleave          : 'hideOverlay'
        'click .queued-btn' : 'toggleQueued'

  class List.QueuedListView extends App.Views.CompositeView
    template: 'queued/list/templates/queuedmovies'
    childView: List.QueuedMovieView