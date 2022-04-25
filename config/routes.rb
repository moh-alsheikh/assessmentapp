Rails.application.routes.draw do
  
  root "home#welcome"

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  
  resources :users   
  
  resources :quizzes do
    resources :questions  do
      resources :options
    end
  end

  # API V1
  namespace :api, defaults: {format: :json}  do
    namespace :v1 do      
      post 'login', to: 'sessions#create'
      post 'logout', to: 'sessions#destroy'      
      resources :quizzes, only: [:index, :show]      
      resources :quiz_user_answers, only: [:create]      
    end
  end

  

  
end
