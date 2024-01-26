Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end

  namespace :api do
    resources :users, only: [:index] do
      member do
        get :posts
      end
    end

    resources :posts, only: [] do
      member do
        get :comments
        post :add_comment
      end
    end
  end
end
