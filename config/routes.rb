Rails.application.routes.draw do
  devise_for :users
  
  root to: "groups#index"
  resources :users do
    resources :entities
    resources :groups
  end

  resources :groups do
    resources :entities
  end

  resources :entities
end
