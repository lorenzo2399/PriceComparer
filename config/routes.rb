Rails.application.routes.draw do
  get 'users/show'
  resources :user
  root 'pages#home'
  get "pages/search", to: "pages#search", as:"search"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
    resources :user do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
