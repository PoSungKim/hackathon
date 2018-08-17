Rails.application.routes.draw do

  get 'home/index'
  root 'home#index' #임시

  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registraions: 'user/registrations'}
  resources :restaurants do
    resources :allergies
  end

  #root 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
