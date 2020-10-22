Rails.application.routes.draw do

  devise_for :users

  root "homes#top"
  get 'homes/about'

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy, :index]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :posts do
    collection {get "search"}
    resource :favorites, only: [:create, :destroy, :index]
    resource :post_comments, only: [:create, :destroy]
  end
  get 'posts/search' => 'posts#search'
  resources :tags do
    get 'posts', to: 'posts#taglist'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
