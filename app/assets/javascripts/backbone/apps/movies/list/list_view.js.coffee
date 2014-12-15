@VideoTracker.module "MoviesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'movies/list/templates/list_layout'
    regions: 
      "panelRegion"  : "#panel-region"
      "moviesRegion" : "#movies-region"

  class List.PanelView extends Marionette.ItemView
    template: 'movies/list/templates/_panel'

  class List.MovieView  extends Marionette.ItemView
    initialize: ->
      Marionette.bindEntityEvents(this, this.model, this.modelEvents)
      attributes = ['watched', 'queued', 'trashed']
      for attr in attributes
        if this.model.get(attr) is true
          this.$el.addClass('no-display')
    template: 'movies/list/templates/_movie'
    tagName: 'tr'
    modelEvents: 
      "change" : "remove"
    events: 
      'click .watched-btn' : 'toggleWatched'
      'click .queued-btn'  : 'toggleQueued'
      'click .trashed-btn' : 'toggleTrashed'
      # 'click .btn-group'   : 'hideMovie'
      'mouseenter'         : 'showOverlay'
      'mouseleave'         : 'hideOverlay'

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
      console.log this.model.get('queued')

    toggleTrashed: ->
      if this.model.get('trashed') is true
        this.model.set(trashed: false).save()
      else
        this.model.set(trashed: true).save()
      console.log this.model.get('trashed')

    hideMovie: ->
      this.$el.fadeOut(500)

    showOverlay: ->
      this.$el.find('.overlay').fadeIn(500)


    hideOverlay: ->
      this.$el.find('.overlay').fadeOut(500)

  class List.MovieCollectionView extends Marionette.CompositeView
    template: 'movies/list/templates/_movies'
    childView: List.MovieView
    childViewContainer: 'tbody'