Rails.application.routes.draw do

  devise_for :users

  resources :projects do
    resources :comments, only: [:new, :create, :show, :destroy]
    resources :team, only: [:new, :create, :edit, :update]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
