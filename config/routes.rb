Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items, only: [:show, :index, :update], path: "kittens"
  resources :users, only: [:show, :update, :edit], path: "profile"
  resources :carts, only: [:show, :update, :destroy, :create], path: "my_cart"

  resources :cart_items

  # Routes Stripe Checkout
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end  
end
