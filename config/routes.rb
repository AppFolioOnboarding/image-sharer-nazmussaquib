Rails.application.routes.draw do
  resources :images, only: %i[new create show index destroy edit update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'
end
