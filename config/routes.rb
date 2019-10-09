Rails.application.routes.draw do
  get 'dashboard/show'
  root 'home#index'
  get "/auth/github/callback", to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'
end
