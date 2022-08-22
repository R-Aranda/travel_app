Rails.application.routes.draw do
  root 'homes#index'
  
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :countries, only: [:index, :show, :create], param: :slug
      resources :posts, only: [:index, :show, :create], param: :id
      resources :comments, only: [:create]
      resources :post_likes, only: [:create]
      resources :comment_likes, only: [:create]
      resources :cities, only: [:show, :index, :create]
    end
  end

  get "*path", to: "homes#index", via: :all
end