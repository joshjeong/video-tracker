@VideoTracker.module "WatchedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WatchedMovieView extends App.Views.ItemView
    template: 'watched/list/templates/_watchedmovie'
    events: ->
      _.extend {}, App.Views.ItemView::events,
        mouseenter            : 'showOverlay'
        mouseleave            : 'hideOverlay'
        'click .watched-btn'  : 'toggleWatched'

  class List.WatchedCollection extends App.Views.CompositeView
    template: 'watched/list/templates/_watchedmovies'
    childView: List.WatchedMovieView
