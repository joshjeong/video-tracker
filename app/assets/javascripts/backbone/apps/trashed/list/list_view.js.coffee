@VideoTracker.module "TrashedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.TrashedView extends Marionette.ItemView
    template: 'trashed/list/templates/_trashedmovie'
    tagName: 'tr'
    events: 
      'click .remove-btn'  : 'untrash'
      'mouseenter'         : 'showOverlay'
      'mouseleave'         : 'hideOverlay'

    untrash: ->
      this.model.set(trashed: false).save()

    showOverlay: ->
      this.$el.find('.overlay').fadeIn(500)

    hideOverlay: ->
      this.$el.find('.overlay').fadeOut(500)


  class List.TrashedListCollection extends Marionette.CompositeView
    template: 'trashed/list/templates/_trashedmovies'
    childView: List.TrashedView
    childViewContainer: 'tbody'