Backbone.Router.extend
  routes:
    "dashboard/:id": "dashboardShow"

  start: ->
    Backbone.history.start(pushState: true)

  dashboardShow: ->
