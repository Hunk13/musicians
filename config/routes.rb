Rails.application.routes.draw do
  devise_for :users
  resources :musicians

  root 'musicians#index'
end
