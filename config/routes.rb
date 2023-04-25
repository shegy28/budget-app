Rails.application.routes.draw do
  get 'expenses/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'groups#index'
  
  resources :users, only: [:index, :show, :new] do
    resources :groups, only: [:new, :create, :show, :index, :destroy]
    resources :expenses, only: [:new, :create, :index, :show, :destroy]
  end
end
