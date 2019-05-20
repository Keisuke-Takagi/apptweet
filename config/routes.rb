Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:new, :index, :create, :destroy, :edit, :update] do
  resources :users do
    collection do
      get 'search'
    end
  end
end
end