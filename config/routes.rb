Rails.application.routes.draw do
  namespace :admin do
    resources :users do
     get 'email', on: :member
     get 'verificate', on: :member
     resources :areas
    end
    get 'verificate/index'
    get 'index'
  end




  devise_for :users



  resources :users do
     resources :areas
  end


  root 'home#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
