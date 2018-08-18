Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  #----------resouces :restaurants do resouces:allergies 보다 위에 가게 해야 함! --------------------
  get 'restaurants/search' => "restaurants#search"
  get 'allergies/search' => "allergies#search"
  get 'allergies/getMenu' => "allergies#getMenu"
  
  get 'allergies/index' => "allergies#index", as: 'allergies' 
  #-------------------------------------------------------------------------------------------------
  
  resources :restaurants do
    resources :allergies
  end

  #메뉴
  resources :menus

  ##로그인과 관리자 페이지
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registraions: 'user/registrations'}
  devise_scope :user do
    get 'editsns', :to => 'devise/registrations#editsns'
  end

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #---------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
