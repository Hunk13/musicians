Rails.application.routes.draw do
  resources :musicians

  root 'home#index'
end
