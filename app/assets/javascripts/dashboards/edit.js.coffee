if $(".dashboards-edit") != null
  $(->
    dashboard = new Gosalyn.Models.Dashboard(id: window.userId)
    dashboard.fetch()
    dashboardView = new Gosalyn.Views.Dashboards.EditView(model: dashboard)
    $('.content').html dashboardView.el
  )
