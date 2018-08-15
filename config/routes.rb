Rails.application.routes.draw do

  resources :allergies
  root 'allergies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
