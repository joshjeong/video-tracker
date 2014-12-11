@VideoTracker.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Link extends Backbone.Model

  class List.Links extends Backbone.Collection
    model: List.Link

  # API = 
  #   getLinks: ->
  #     new List.Links [
  #       { name: "Movies", Routes.movies_path()}
  #       { name: "TV Shows", Routes.shows_path()}
  #     ]


  # App.reqres.setHandler "links:model", ->
  #   API.getLinks()
