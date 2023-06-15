Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/login", to: "home#login"
  get "/logout", to: "home#logout"

  post "/authenticate", to: "home#authenticate"

  get "/:id", to: "home#show"

  # Endpoint for rendering markdown
  post "/articles/carpet", to: "articles#carpet"

  resources :articles

end
