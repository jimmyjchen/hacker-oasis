Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :collaboration, only: [:new, :create, :edit, :update, :profile]
  end

  root to: 'projects#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
