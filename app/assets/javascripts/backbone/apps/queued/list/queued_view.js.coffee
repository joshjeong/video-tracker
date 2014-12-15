@VideoTracker.module "QueuedApp.List", (List, App, Backbone, Marionette, $, _) ->
  class List.QueuedMovieView extends Marionette.ItemView
    template: 'queued/list/templates/queuedmovie'
    tagName: 'tr'
    events: 
      'click .remove-btn'  : 'unqueue'
      'mouseenter'         : 'showOverlay'
      'mouseleave'         : 'hideOverlay'

    unqueue: ->
      this.model.set(queued: false).save()

    showOverlay: ->
      this.$el.find('.overlay').fadeIn(500)

    hideOverlay: ->
      this.$el.find('.overlay').fadeOut(500)


  class List.QueuedListView extends Marionette.CompositeView
    template: 'queued/list/templates/queuedmovies'
    childView: List.QueuedMovieView
    childViewContainer: 'tbody'
