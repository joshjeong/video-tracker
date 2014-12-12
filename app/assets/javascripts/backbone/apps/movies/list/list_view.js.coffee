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
      if this.model.get('watched') is true
        this.$el.addClass('watched')
      if this.model.get('queued') is true
        this.$el.addClass('queued')
    template: 'movies/list/templates/_movie'
    tagName: 'tr'
    events: 
      'click .watched-btn' : 'toggleWatched'
      'click .queued-btn' : 'toggleQueued'
      'mouseenter' : 'showOverlay'
      'mouseleave' : 'hideOverlay'

    # getTemplate: ->
    #   if this.model.get('watched') is true
    #     return "movies/list/templates/_movie"
    #   else
    #     return "movies/list/templates/_watched"


    toggleWatched: -> 
      this.$el.toggleClass('watched')
      if this.model.get('watched') is true
        this.model.set(watched: false).save()
      else
        this.model.set(watched: true).save()
        
    toggleQueued: ->
      this.$el.toggleClass('queued')
      console.log this.model.get('queued')
      if this.model.get('queued') is true
        this.model.set(queued: false).save()
      else
        this.model.set(queued: true).save()
      console.log this.model.get('queued')


    showOverlay: ->
      this.$el.find('.overlay').fadeIn(500)


    hideOverlay: ->
      this.$el.find('.overlay').fadeOut(500)

  class List.MovieCollectionView extends Marionette.CompositeView
    template: 'movies/list/templates/_movies'
    childView: List.MovieView
    childViewContainer: 'tbody'