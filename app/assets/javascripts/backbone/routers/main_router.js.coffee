class Gosalyn.Routers.DashboardRouter extends Backbone.Router
  routes:
    "dashboard/:id": "dashboardShow"

  start: ->
    Backbone.history.start(pushState: true)

  dashboardShow: ->

