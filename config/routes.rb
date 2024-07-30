Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end




  devise_for :users
  root 'home#index'
  get 'admin/index'


  resources :users do
    resources :areas
  end



end
