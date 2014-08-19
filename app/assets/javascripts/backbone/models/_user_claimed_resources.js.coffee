class Gosalyn.Models.UserClaimedResources extends Backbone.Collection
  # configuration
  resource: ''
  claimResource: ''
  model: Backbone.Model

  # inherited functionalities
  url: =>
    "http://#{window.adapterHost}/api/management/users/#{window.userId}/#{@resource}"
  saveUrl: =>
    "http://#{window.adapterHost}/api/management/claimable/#{@claimResource}"
  model: Gosalyn.Models.UserClaimedCampaign
  authHeader: { 'API_KEY': 'management_api_key' }

  initialize: ->
    @on 'sync', @saveServerKeys, @

  update: ->
    pendingClaim = _.difference @getKeys(), @_serverKeys
    pendingRemoval = _.difference @_serverKeys, @getKeys()

    _.each(pendingClaim, (key) ->
      payload = {}
      payload[@claimResource] = user_id: window.userId, id: key
      $.ajax url: @saveUrl(), type: 'POST', data: payload, headers: @authHeader
    , @)

    _.each(pendingRemoval, (key) ->
      $.ajax url: "#{@saveUrl()}/#{key}", type: 'DELETE', headers: @authHeader
    , @)

  getKeys: ->
    _.map @models, (campaign) ->
      campaign.id

  saveServerKeys: ->
    @_serverKeys = @getKeys()

  parse: (response) ->
    response[@resource]
