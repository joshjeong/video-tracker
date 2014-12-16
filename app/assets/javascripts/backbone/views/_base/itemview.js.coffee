@VideoTracker.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  class Views.ItemView extends Marionette.ItemView
    initialize: ->
      Marionette.bindEntityEvents(this, this.model, this.modelEvents)
    tagName: 'tr'
    modelEvents: 
      "change" : "remove"
    orignalEvents: 
      'mouseenter'         : 'showOverlay'
      'mouseleave'         : 'hideOverlay'

    showOverlay: ->
      this.$el.find('.overlay').fadeIn(500)

    hideOverlay: ->
      this.$el.find('.overlay').fadeOut(500)


