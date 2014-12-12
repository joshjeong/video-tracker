@VideoTracker.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Link extends Backbone.Model

  class List.Links extends Backbone.Collection
    model: List.Link

  API = 
    getLinks: ->
      new List.Links [
        { name: "Movies" }
        { name: "Watched" }
        { name: "Shows" }
      ]

  App.reqres.setHandler "links:model", ->
    API.getLinks()
