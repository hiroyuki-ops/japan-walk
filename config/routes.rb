Rails.application.routes.draw do

  devise_for :users

  root "homes#top"
  get 'homes/about'


  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    member do
     get :following, :followers
     resources :favorites, only: [:index]
    end
  end

  resources :posts do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
    collection {get "search"}
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:index]

  resources :categorys do
    get 'posts', to: 'posts#search'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
