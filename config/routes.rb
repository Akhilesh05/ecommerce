# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders do
    resources :order_lines
  end

  resources :products do
    resources :images
  end

  resources :brands do
    resources :products
  end

  resources :users, except: :index do
    post '/authenticate', on: :collection, action: :authenticate
    resources :addresses
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
