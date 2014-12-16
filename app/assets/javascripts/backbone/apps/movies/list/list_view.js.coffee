@VideoTracker.module "MoviesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'movies/list/templates/list_layout'
    regions: 
      "panelRegion"  : "#panel-region"
      "moviesRegion" : "#movies-region"

  class List.PanelView extends Marionette.ItemView
    template: 'movies/list/templates/_panel'

  class List.MovieView  extends App.Views.ItemView
    initialize: ->
      attributes = ['watched', 'queued', 'trashed']
      for attr in attributes
        if this.model.get(attr) is true
          this.$el.addClass('no-display')
    template: 'movies/list/templates/_movie'
    events: ->
      _.extend {}, App.Views.ItemView::events,
        mouseenter           : 'showOverlay'
        mouseleave           : 'hideOverlay'
        'click .watched-btn' : 'toggleWatched'
        'click .queued-btn'  : 'toggleQueued'
        'click .trashed-btn' : 'toggleTrashed'

  class List.MovieCollectionView extends App.Views.CompositeView
    template: 'movies/list/templates/_movies'
    childView: List.MovieView
