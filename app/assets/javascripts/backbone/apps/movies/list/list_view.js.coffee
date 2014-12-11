@VideoTracker.module "MoviesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'movies/list/templates/list_layout'
    regions: 
      panelRegion: "#panel-region"
      moviesRegion: "#movies-region"

  class List.PanelView extends Marionette.ItemView
    template: 'movies/list/templates/_panel'

  class List.MovieView extends Marionette.ItemView
    template: 'movies/list/templates/_movie'
    tagName: 'tr'

  class List.MovieCollectionView extends Marionette.CompositeView
    template: 'movies/list/templates/_movies'
    childView: List.MovieView
    childViewConatiner: 'tbody'