@VideoTracker.module "ShowsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Show extends Backbone.Model

  class List.Shows extends Backbone.Collection
    model: List.Show
    url: Routes.shows_path()

  API = 
    getShowCollection: (cb) ->
      shows = new List.Shows
      shows.fetch
        success: -> 
          console.log shows
          cb shows

  App.reqres.setHandler "show:model", (cb)->
    API.getShowCollection cb