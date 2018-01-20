Rails.application.routes.draw do
  resources :guests
  resources :reservations
  resources :restaurants
end
