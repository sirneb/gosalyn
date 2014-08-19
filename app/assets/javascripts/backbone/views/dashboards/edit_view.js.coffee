Gosalyn.Views.Dashboards ||= {}

class Gosalyn.Views.Dashboards.EditView extends Backbone.View
  template: HandlebarsTemplates["dashboards/edit/index"]

  _pendingDfp: []

  events:
    "click #save-btn": "update",

  updatePendingDfp: (e) ->
    @_pendingDfp = $('#dfp-select').val()

  toggleTransparency: (e) ->
    @model.toggle 'low_transparency'

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

    availableDfpCampaigns = new Gosalyn.Models.AvailableDfpCampaigns()
    @userDfpCampaigns = new Gosalyn.Models.UserDfpCampaigns()

    availableAdwordsCustomers = new Gosalyn.Models.AvailableAdwordsCustomers()
    @userAdwordsCustomers = new Gosalyn.Models.UserAdwordsCustomers()

    transparencyView = new Gosalyn.Views.Dashboards.EditLowTransparencyView(model: @model)

    dfpView = new Gosalyn.Views.Dashboards.EditDfpCampaignsView
      available: availableDfpCampaigns,
      claimedByUser: @userDfpCampaigns

    semView = new Gosalyn.Views.Dashboards.EditAdwordsCustomersView
      available: availableAdwordsCustomers,
      claimedByUser: @userAdwordsCustomers

    $('#low-transparency').html transparencyView.render().el
    $('#dfp-campaigns').html dfpView.el
    $('#adwords-customers').html semView.el

    $(".chosen-select").chosen(width: '66%')
    @
