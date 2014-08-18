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

  initialize: ->
    @model.on 'sync', @render, @
    # @model.on 'serverAttrSaved', @render, @

  render: ->
    @$el.html @template(@model.forTemplate())

    claimableDfpCampaigns = new Gosalyn.Models.ClaimableDfpCampaigns()
    userDfpCampaigns = new Gosalyn.Models.UserDfpCampaigns()

    claimableDfpCampaigns.fetch()
    userDfpCampaigns.fetch()

    transparencyView = new Gosalyn.Views.Dashboards.EditLowTransparencyView(model: @model)
    dfpView = new Gosalyn.Views.Dashboards.EditDfpCampaignsView
      claimable: claimableDfpCampaigns,
      userAssociated: userDfpCampaigns

    $('#low-transparency').html transparencyView.render().el
    $('#dfp-campaigns').html dfpView.el

    $(".chosen-select").chosen(width: '66%')
    @
