Rails.application.routes.draw do

  resources :restaurants do
    resources :allergies
  end
  #root 'restaurants#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registraions: 'user/registrations'}
  devise_scope :user do
    get 'editsns', :to => 'devise/registrations#editsns'
  end
  ######### 임시
  get 'home/index'
  root 'home#index' 
  ##########

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
