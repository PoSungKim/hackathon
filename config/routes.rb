Rails.application.routes.draw do

  resources :restaurants do
    resources :allergies
  end
  #root 'restaurants#index'

  ## 로그인과 관리자 페이지
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registraions: 'user/registrations'}
  devise_scope :user do
    get 'editsns', :to => 'devise/registrations#editsns'
  end
  get 'home/index'
  ######### 임시
  root 'home#index' 
  ##########
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
