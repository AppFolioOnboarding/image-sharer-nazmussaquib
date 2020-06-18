Rails.application.routes.draw do
  resources :images do
    collection do 
      get 'search/:q', :action => 'search', :as => 'search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'
end
