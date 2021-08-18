Rails.application.routes.draw do
  root 'tests#index'
  resources :tests do
    member do
      post :start
    end
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
  end
  resources :user_tests, only: %i[show update] do
    member do
      get :result
    end
  end
end
