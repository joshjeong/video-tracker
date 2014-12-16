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
      'click .watched-btn' : 'toggleWatched'
      'click .queued-btn'  : 'toggleQueued'
      'click .trashed-btn' : 'toggleTrashed'
      
    showOverlay: ->
      this.$el.find('.overlay').fadeIn(500)

    hideOverlay: ->
      this.$el.find('.overlay').fadeOut(500)

    toggleWatched: -> 
      if this.model.get('watched') is true
        this.model.set(watched: false).save()
      else
        this.model.set(watched: true).save()
        
    toggleQueued: ->
      if this.model.get('queued') is true
        this.model.set(queued: false).save()
      else
        this.model.set(queued: true).save()

    toggleTrashed: ->
      if this.model.get('trashed') is true
        this.model.set(trashed: false).save()
      else
        this.model.set(trashed: true).save()


