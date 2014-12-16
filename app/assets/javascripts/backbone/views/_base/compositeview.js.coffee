@VideoTracker.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  class Views.CompositeView extends Marionette.CompositeView
    childViewContainer: 'tbody'