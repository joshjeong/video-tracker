@VideoTracker.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.HeaderView extends Marionette.ItemView
    template: "header/list/templates/_link"
    tagName: 'li'

  class List.HeaderViewCollection extends Marionette.CompositeView
    template: "header/list/templates/_links"
    childView: List.HeaderView
    childViewContainer: 'ul'
