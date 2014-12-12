@VideoTracker.module "TrashedApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.TrashedView extends Marionette.ItemView
    template: 'trashed/list/templates/_trashedmovie'
    tagName: 'tr'

  class List.TrashedListCollection extends Marionette.CompositeView
    template: 'trashed/list/templates/_trashedmovies'
    childView: List.TrashedView
    childViewContainer: 'tbody'