Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  ##----------resouces :restaurants do resouces:allergies 보다 위에 가게 해야 함! --------------------
  get 'restaurants/search' => "restaurants#search"
  get 'allergies/search' => "allergies#search"
  get 'allergies/getMenu' => "allergies#getMenu"
  
  get 'allergies/index' => "allergies#index", as: 'allergies' 
  
  resources :menus #메뉴

  resources :restaurants do
    resources :allergies
  end
  ##-------------------------------------------------------------------------------------------master//

  ##로그인과 관리자 페이지
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registraions: 'user/registrations'}
  devise_scope :user do
    get 'editsns', :to => 'devise/registrations#editsns'
  end

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin' #devise보다 아래위치
  resources :boards #임시 
  #알림 : 전체 삭제
  get '/new_alarms/read_all' => 'new_alarms#read_all'
  #알림 삭제보다아래위치
  resources :new_alarms
  ##----------------------------------------------------------------------------------------------syy//

end
