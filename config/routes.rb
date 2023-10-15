Rails.application.routes.draw do

resource :users, except: [:edit, :create, :update]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'pages#home'


  get "researches/ordina" , to: "researches#ordina", as:"ordina"
  get "researches/ofeedordina" , to: "researches#feedordina", as:"feedordina"



  # User resources for reviews and researches
  resources :users do
    resources :reviews
    resources :researches
    resources :messages, only: [:new, :create, :destroy] 
  end
    
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  # Custom search route
  get "pages/search", to: "pages#search", as: "search"

  get "pages/cambia", to:"pages#cambia", as:"cambia"


  get 'admin_board/set_mod', to: 'users#set_mod', as: 'set_mod'

  get 'admin_board/remove_mod', to: 'users#remove_mod', as:'remove_mod'

  get 'admin_board', to: 'users#admin_board', as: 'admin_board'
end
