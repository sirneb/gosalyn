Gosalyn.Views.Dashboards ||= {}

class Gosalyn.Views.Dashboards.EditLowTransparencyView extends Backbone.View
  template: HandlebarsTemplates["dashboards/edit/low_transparency"]

  events:
    "click [data-low_transparency]": "toggleTransparency",

  initialize: ->
    @model.on 'change:low_transparency', @render, @

  render: ->
    @$el.html @template(@model.forTemplate())
    @

  toggleTransparency: (e) ->
    @model.toggle 'low_transparency'
