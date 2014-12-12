@VideoTracker.module "QueuedApp.List", (List, App, Backbone, Marionette, $, _) ->
  class List.QueuedMovieView extends Marionette.ItemView
    template: 'queued/list/templates/queuedmovie'
    tagName: 'tr'

  class List.QueuedListView extends Marionette.CompositeView
    template: 'queued/list/templates/queuedmovies'
    childView: List.QueuedMovieView
    childViewContainer: 'tbody'
