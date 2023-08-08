Rails.application.routes.draw do
  resources :users do
    resources :entities
    resources :groups
  end

  resources :groups do
    resources :entities
  end

  resources :entities
end
