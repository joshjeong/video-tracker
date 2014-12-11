@VideoTracker.module "ShowsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: "shows/list/templates/list_layout"
    regions:
      "panelRegion" : "#panel-region"
      "showsRegion" : "#shows-region"

  class List.PanelView extends Marionette.ItemView
    template: "shows/list/templates/_panel"

  class List.ShowView extends Marionette.ItemView
    initialize: ->
      if this.model.get('watched') is true
        this.$el.addClass('watched')
    template: 'shows/list/templates/_show'
    tagName: 'tr'
    events: 
      'click' : 'toggleWatched'
      'mouseenter' : 'showOverlay'
      'mouseleave' : 'hideOverlay'

    toggleWatched: -> 
      this.$el.toggleClass('watched');
      if this.model.get('watched') is true
        this.model.set(watched: false).save()
      else
        this.model.set(watched: true).save()

    showOverlay: ->
      this.$el.find('.main').toggleClass('no-display')
      this.$el.find('.overlay').toggleClass('no-display')

    hideOverlay: ->
      this.$el.find('.main').toggleClass('no-display')
      this.$el.find('.overlay').toggleClass('no-display')

  class List.ShowCollectionView extends Marionette.CompositeView
    template: "shows/list/templates/_shows"
    childView: List.ShowView
    childViewContainer: 'tbody'
