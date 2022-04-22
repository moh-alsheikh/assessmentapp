Rails.application.routes.draw do
  
  root "home#welcome"

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  
  resources :users   
  
  resources :quizzes do
    resources :quiz_questions  do
      resources :quiz_question_options
    end
  end
  
end
