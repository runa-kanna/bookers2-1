Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users

  root to: "homes#top"
  get "home/about"=>"homes#about"
  resources :books, only: [:new, :show, :index, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :create, :show, :edit, :update]

  get "/homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
