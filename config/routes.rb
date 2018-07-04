# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products do
        resources :images
        resources :price_changes
      end

      resources :brands do
        resources :products
      end

      resources :users do
        resources :addresses
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
