Rails.application.routes.draw do
  get "login", to: "sessions#new"
  get "auth/okta/callback", to: "sessions#create"
  get "auth/failure", to: "sessions#failure"

  get 'members/create'
  resources :rotas do
    resources :members, only: [:create, :destroy] do
      member do
        post :move_top
        post :move_bottom
        post :move_up
        post :move_down
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rotas#index"
end
