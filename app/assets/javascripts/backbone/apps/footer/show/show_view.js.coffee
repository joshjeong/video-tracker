@VideoTracker.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.FooterView extends Marionette.ItemView
    template: 'footer/show/templates/show_footer'