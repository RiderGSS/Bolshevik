Rails.application.routes.draw do
  resources :posts
  namespace :admin do
    resources :users do
     get 'email', on: :member
     get 'verificate', on: :member
     resources :areas
    end
    resources :polls
    get 'verificate/index'
    get 'index'
  end




  devise_for :users



  resources :users do
     resources :areas
  end


  root 'home#index'
  resources :polls,only: %i[index show]
  resources :votes, only: [:create]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
