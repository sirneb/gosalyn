Rails.application.routes.draw do
  resources :dashboards, only: [:show, :edit]
end
