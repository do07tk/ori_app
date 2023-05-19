Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  get 'tweets/index'
  root to: "tweets#index"

  resources :tweets do
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy, :index]
  end

  resources :users, only: :show
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
