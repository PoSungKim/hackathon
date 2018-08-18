Rails.application.routes.draw do
  #음식점
  resources :restaurants
  
  #메뉴
  resources :menus
  
  root 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
