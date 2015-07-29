Rails.application.routes.draw do
  devise_for :users

  root to: 'companies#index'

  concern :favoritable do
    member do
      patch :add_to_favorites
      patch :remove_from_favorites
    end
  end

  resources :companies, only: [:index, :show], concerns: :favoritable
  resources :people, only: [], concerns: :favoritable

  get :favorites, to: 'favorites#index'
end
