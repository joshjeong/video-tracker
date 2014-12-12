@VideoTracker.module "WatchedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WatchedMovieView extends Marionette.ItemView
    template: 'watched/list/templates/_watchedmovie'
    tagName: 'tr'



  class List.WatchedCollection extends Marionette.CompositeView
    template: 'watched/list/templates/_watchedmovies'
    childView: List.WatchedMovieView
    childViewContainer: 'tbody'