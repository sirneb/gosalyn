Gosalyn.Views.Dashboards ||= {}

class Gosalyn.Views.Dashboards.EditCampaignsView extends Backbone.View
  # configuration
  template: HandlebarsTemplates["dashboards/edit/dfp_campaigns"]
  id: ''
  availableCampaignClass: Backbone.View

  # inherited
  tagName: 'select'
  className: 'chosen-select'
  attributes:
    'multiple': ''

  events:
    "change": "changeUserAssociated"

  changeUserAssociated: (e, obj) ->
    if _.has(obj, 'selected')
      @campaigns.claimedByUser.add @campaigns.available.get(obj.selected)
    else if _.has(obj, 'deselected')
      @campaigns.claimedByUser.remove @campaigns.claimedByUser.get(obj.deselected)

  initialize: (model) ->
    @campaigns = model
    @campaigns.available.on 'add', @render, @
    @campaigns.claimedByUser.on 'sync', @addUserCampaigns, @

    @campaigns.available.fetch().then =>
      @campaigns.claimedByUser.fetch()

  render: ->
    @$el.html @template(campaigns: @campaigns.available.toJSON())
    keys = @stringifyKeys @campaigns.claimedByUser.getKeys()
    @$el.val(keys).trigger('chosen:updated')
    @

  addUserCampaigns: ->
    _.each(@campaigns.claimedByUser.models, (campaign) ->
      @campaigns.available.add(new @availableCampaignClass(campaign.toJSON()))
    , @)

  stringifyKeys: (keys) ->
    _.map keys, (key) ->
      key.toString()

