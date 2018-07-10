# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, except: :index do
    post '/authenticate', on: :collection, action: :authenticate
  end

  resources :addresses do
    resources :orders, except: :update
  end

  resources :orders, except: %i[update create] do
    resources :order_lines, except: :update
  end

  resources :products do
    resources :images
  end

  resources :brands do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
