# frozen_string_literal: true

Rails.application.routes.draw do
  resources :order_lines
  resources :orders
  resources :products do
    resources :images
    resources :price_changes
  end

  resources :brands do
    resources :products
  end

  resources :users, except: :index do
    post '/authenticate', on: :collection, action: :authenticate
    resources :addresses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
