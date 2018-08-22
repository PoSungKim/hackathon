Rails.application.routes.draw do

  get 'edit_asks/index'

  get 'edit_asks/ask'

  resources :zizuminfos
  get 'home/index'
  root 'home#index'
  get 'home/about'

  #----------resouces :restaurants 보다 위에 가게 해야 함! --------------------
  get 'restaurants/search' => "restaurants#search"
  get 'menus/search' => "menus#search"
  get 'menus/getMenu' => "menus#getMenu"
  # get 'allergies/index' => "allergies#index", as: 'allergies' 
  get 'menus/index' => "menus#index", as: 'menus' 

  resources :menus #메뉴
  resources :restaurants do
    resources :allergies
  end
  ##-------------------------------------------------------------------------------------------master//

  ### 로그인과 관리자 페이지 ### rails/db 관리자설정으로바꾸려면 config/initializer/rails_db 주석해제!
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registraions: 'user/registrations'}
  devise_scope :user do
    get 'editsns', :to => 'devise/registrations#editsns'
  end
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin' #devise보다 아래위치

  ### 알림 ###
  get '/new_alarms/read_all' => 'new_alarms#read_all'# 전체 삭제
  resources :new_alarms  #알림 삭제보다아래위치
  resources :boards #임시

  ### api테스트 ###
  get 'result2/:keyword' => 'boards#result2' 

  ### 나만의 페이지 ###
  resources :profiles
  post '/profiles/:id/follow', to: 'follows#profile_follow_toggle', as: 'profile_follow'

  ### Public Market ###
  resources :articles
  post '/articles/:id/follow', to: 'follows#article_follow_toggle', as: 'article_follow'
  
  ### 회원가입 Devise ###
  # devise_for :users

  ### 크롤링 ###
  get '/crawling' => 'restaurants#crawling'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
