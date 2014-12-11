@VideoTracker.module "MoviesApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  List.Controller =
    # Passes the code responsible for instantiating the view as a callback for a request for movie model
    listMovies: ->
      App.request "movie:model", (movies) =>

        @layout = @getListLayout()
        
        @layout.on 'show', =>
          @showPanel movies
          @showMovies movies

        App.mainRegion.show @layout

    getListLayout: ->
      new List.Layout

    showPanel: (movies) ->
      # create view
      panelView = @getPanel movies
      # show view
      @layout.panelRegion.show panelView

    showMovies: (movies) ->
      movieCollectionView = @getMovies movies
      @layout.moviesRegion.show movieCollectionView

    getMovies: (movies) ->
      movieCollectionView = new List.MovieCollectionView
        collection: movies

    getPanel: (movies) ->
      new List.PanelView
        collection: movies




