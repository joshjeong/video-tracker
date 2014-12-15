@VideoTracker.module "WatchedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WatchedMovieView extends Marionette.ItemView
    template: 'watched/list/templates/_watchedmovie'
    tagName: 'tr'
    events: 
      'click .remove-btn'  : 'unwatch'
      'mouseenter'         : 'showOverlay'
      'mouseleave'         : 'hideOverlay'

    unwatch: ->
      this.model.set(watched: false).save()

    showOverlay: ->
      this.$el.find('.overlay').fadeIn(500)

    hideOverlay: ->
      this.$el.find('.overlay').fadeOut(500)



  class List.WatchedCollection extends Marionette.CompositeView
    template: 'watched/list/templates/_watchedmovies'
    childView: List.WatchedMovieView
    childViewContainer: 'tbody'