Gosalyn.Views.Dashboards ||= {}

class Gosalyn.Views.Dashboards.EditView extends Backbone.View
  template: HandlebarsTemplates["dashboards/edit/index"]

  events:
    "click #save-btn": "update",

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.update()
    @userDfpCampaigns.update()
    @userAdwordsCustomers.update()

  initialize: ->
    @model.on 'sync', @render, @

  render: ->
    @$el.html @template(@model.forTemplate())

    # Models
    availableDfpCampaigns = new Gosalyn.Models.AvailableDfpCampaigns()
    availableAdwordsCustomers = new Gosalyn.Models.AvailableAdwordsCustomers()
    @userDfpCampaigns = new Gosalyn.Models.UserDfpCampaigns()
    @userAdwordsCustomers = new Gosalyn.Models.UserAdwordsCustomers()

    # Views
    transparencyView = new Gosalyn.Views.Dashboards.EditLowTransparencyView(model: @model)
    hasAnalyticsView = new Gosalyn.Views.Dashboards.EditHasAnalyticsView(model: @model)
    dfpView = new Gosalyn.Views.Dashboards.EditDfpCampaignsView
      available: availableDfpCampaigns,
      claimedByUser: @userDfpCampaigns
    semView = new Gosalyn.Views.Dashboards.EditAdwordsCustomersView
      available: availableAdwordsCustomers,
      claimedByUser: @userAdwordsCustomers

    # Dom inserts
    $('#low-transparency').html transparencyView.render().el
    $('#has-analytics').html hasAnalyticsView.render().el
    $('#dfp-campaigns').html dfpView.el
    $('#adwords-customers').html semView.el

    # Misc JS Initiation
    $(".chosen-select").chosen(width: '66%')
    @
