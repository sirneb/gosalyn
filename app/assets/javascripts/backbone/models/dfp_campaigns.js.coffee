class Gosalyn.Models.ClaimableDfpCampaign extends Backbone.Model

class Gosalyn.Models.ClaimableDfpCampaigns extends Backbone.Collection
  url: "http://#{window.adapterHost}/api/management/claimable/dfp_campaigns"
  model: Gosalyn.Models.ClaimableDfpCampaign

  parse: (response) ->
    response['dfp_campaigns']


class Gosalyn.Models.UserDfpCampaign extends Backbone.Model

class Gosalyn.Models.UserDfpCampaigns extends Backbone.Collection
  url: "http://#{window.adapterHost}/api/management/users/#{window.userId}/dfp_campaigns"
  model: Gosalyn.Models.UserDfpCampaign

  keys: ->
    _.map @models, (campaign) ->
      "#{campaign.id}"

  parse: (response) ->
    response['dfp_campaigns']
