class Gosalyn.Models.AvailableDfpCampaign extends Backbone.Model

class Gosalyn.Models.AvailableDfpCampaigns extends Backbone.Collection
  url: "http://#{window.adapterHost}/api/management/claimable/dfp_campaigns"
  model: Gosalyn.Models.AvailableDfpCampaign

  parse: (response) ->
    response['dfp_campaigns']


class Gosalyn.Models.UserDfpCampaign extends Backbone.Model

class Gosalyn.Models.UserDfpCampaigns extends Gosalyn.Models.UserClaimedResources
  resource: 'dfp_campaigns'
  claimResource: 'display_claim'
  model: Gosalyn.Models.UserDfpCampaign
