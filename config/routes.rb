Rails.application.routes.draw do
  get "/health/live", to: "health#live"
  get "/ready", to: "health#ready"
  resources :accessions, only: [:create, :index, :show], param: :reference
end
