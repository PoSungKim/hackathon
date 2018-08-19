Rails.application.routes.draw do

  resources :zizuminfos
  get 'home/index'
  root 'home#index'

  #----------resouces :restaurants 보다 위에 가게 해야 함! --------------------
  get 'restaurants/search' => "restaurants#search"
  get 'menus/search' => "menus#search"
  get 'menus/getMenu' => "menus#getMenu"
  
  get 'menus/index' => "menus#index", as: 'menus' 
  #-------------------------------------------------------------------------------------------------
  
  resources :restaurants do
    resources :allergies
  end

  #메뉴
  resources :menus

  ### 나만의 페이지 ###
  resources :profiles
  post '/profiles/:id/follow', to: 'follows#profile_follow_toggle', as: 'profile_follow'

  ### Public Market ###
  resources :articles
  post '/articles/:id/follow', to: 'follows#article_follow_toggle', as: 'article_follow'
  
  ### 회원가입 Devise ###
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
