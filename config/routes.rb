Rails.application.routes.draw do
  get 'members/create'
  resources :rotas do
    resources :members, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
