# default setting the API_KEY
Backbone.ajax = _.wrap Backbone.ajax, (fn, params) ->
  params.headers = _.extend {}, params.headers,
    'API_KEY': 'management_api_key'
  fn.call this, params


Gosalyn.Models.Dashboard = Backbone.Model.extend
  urlRoot: "http://#{window.adapterHost}/api/management/users"

  # cached data on the server
  _serverAttr: {}

  parse: (response) ->
    response.user

  update: ->
    payload = @changedAttrs()
    unless _.isEmpty(payload)
      @save user: payload,
        patch: true,

  transparencyChanged: ->
    @_compareWithServerData 'low_transparency'

  forTemplate: ->
    _.extend @toJSON(),
      'transparencyChanged': @transparencyChanged()

  changedAttrs: ->
    serverChanged = {}
    localChanged = @changedAttributes() || {} #changedAttributes return false when no change
    _.each(_.keys(localChanged), (key) ->
      unless localChanged[key] is @_serverAttr[key]
        serverChanged[key] = localChanged[key]
    , @)
    serverChanged

  initialize: ->
    @on 'sync', @saveServerAttr, @

  saveServerAttr: (_, response) ->
    @_serverAttr = @parse response

  toggle: (attr, silent=false) ->
    data = {}
    data[attr] = not @get(attr)
    @set data, {silent: silent}

  _compareWithServerData: (attr) ->
    @get(attr) is not @_serverAttr[attr]
