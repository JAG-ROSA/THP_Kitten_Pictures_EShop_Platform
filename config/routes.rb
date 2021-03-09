Rails.application.routes.draw do
  get 'avatars/create'
  root 'items#index'
  devise_for :users, :skip => [:sessions]
  as :user do
      post "/users/sign_in" => "devise/sessions#create", :as => :user_session
      delete "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  resources :items
  resources :users do 
    resources :avatars, only: [:create]
  end
end
