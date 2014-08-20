Gosalyn.Views.Dashboards ||= {}

class Gosalyn.Views.Dashboards.EditHasAnalyticsView extends Backbone.View
  template: HandlebarsTemplates["dashboards/edit/has_analytics"]

  events:
    "click [data-has_analytics]": "toggleAnalytics",

  initialize: ->
    @model.on 'change:has_analytics', @render, @

  render: ->
    @$el.html @template(@model.forTemplate())
    @

  toggleAnalytics: (e) ->
    @model.toggle 'has_analytics'
