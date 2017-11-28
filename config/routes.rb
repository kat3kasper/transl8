Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/auth/github/callback", to: "sessions#create"
  get "/sign_out", to: "sessions#destroy"

  root to: 'static_pages#home'
end
