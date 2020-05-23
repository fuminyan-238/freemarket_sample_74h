Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'items#index'
  resources :items do
    collection do
      get "set_images"
      post 'pay/:id', to: 'items#pay'
      get 'done', to: 'items#done'
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get "buy"
    end
  end

  resources :users, only: [:show] do
    resources :profiles, only: [:new, :edit, :create, :update]
  end
  resources :credit_cards, only: [:new, :show, :create, :destroy] 
end
