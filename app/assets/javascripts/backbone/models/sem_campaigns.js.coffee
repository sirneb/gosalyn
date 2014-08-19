class Gosalyn.Models.AvailableAdwordsCustomer extends Backbone.Model

class Gosalyn.Models.AvailableAdwordsCustomers extends Backbone.Collection
  url: "http://#{window.adapterHost}/api/management/claimable/adwords_customers"
  model: Gosalyn.Models.AvailableAdwordsCustomer

  parse: (response) ->
    response['adwords_customers']


class Gosalyn.Models.UserAdwordsCustomer extends Backbone.Model

class Gosalyn.Models.UserAdwordsCustomers extends Gosalyn.Models.UserClaimedResources
  resource: 'adwords_customers'
  claimResource: 'adwords_claim'
  model: Gosalyn.Models.UserAdwordsCustomer
