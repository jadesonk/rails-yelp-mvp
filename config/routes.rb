Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'
  resources :restaurants, except: %i[destroy edit update] do
    resources :reviews, only: %i[new create]
  end

  resources :reviews, only: [:index]
end
