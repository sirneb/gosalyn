Gosalyn.Views.Dashboards ||= {}

class Gosalyn.Views.Dashboards.EditDfpCampaignsView extends Backbone.View
  template: HandlebarsTemplates["dashboards/edit/dfp_campaigns"]
  tagName: 'select'
  className: 'chosen-select'
  id: 'dfp-select'
  attributes:
    'multiple': ''

  events:
    "change": "changeUserAssociated"

  changeUserAssociated: (e, obj) ->
    if _.has(obj, 'selected')
      @campaigns.userAssociated.add @campaigns.claimable.get(obj.selected)
    else if _.has(obj, 'deselected')
      @campaigns.userAssociated.remove @campaigns.userAssociated.get(obj.deselected)

  initialize: (model) ->
    @campaigns = model
    @campaigns.claimable.on 'add', @render, @
    @campaigns.userAssociated.on 'sync', @addUserCampaigns, @

  render: ->
    @$el.html @template(campaigns: @campaigns.claimable.toJSON())
    @$el.val(@campaigns.userAssociated.keys()).trigger('chosen:updated')
    @

  addUserCampaigns: ->
    _.each(@campaigns.userAssociated.models, (campaign) ->
      @campaigns.claimable.add(new Gosalyn.Models.ClaimableDfpCampaign(campaign.toJSON()))
    , @)


