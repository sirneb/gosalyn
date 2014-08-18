class Gosalyn.Routers.DashboardsRouter extends Backbone.Router
  initialize: (options) ->
    @dashboards = new Gosalyn.Collections.DashboardsCollection()
    @dashboards.reset options.dashboards

  routes:
    "new"      : "newDashboard"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newDashboard: ->
    @view = new Gosalyn.Views.Dashboards.NewView(collection: @dashboards)
    $("#dashboards").html(@view.render().el)

  index: ->
    @view = new Gosalyn.Views.Dashboards.IndexView(dashboards: @dashboards)
    $("#dashboards").html(@view.render().el)

  show: (id) ->
    dashboard = @dashboards.get(id)

    @view = new Gosalyn.Views.Dashboards.ShowView(model: dashboard)
    $("#dashboards").html(@view.render().el)

  edit: (id) ->
    dashboard = @dashboards.get(id)

    @view = new Gosalyn.Views.Dashboards.EditView(model: dashboard)
    $("#dashboards").html(@view.render().el)
