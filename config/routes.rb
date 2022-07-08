Rails.application.routes.draw do
  get 'members/create'
  resources :rotas do
    resources :members, only: [:create, :destroy] do
      member do
        post :relieve
        post :move_up
        post :move_down
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
