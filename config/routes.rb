Rails.application.routes.draw do
  devise_for :users
  root 'tests#index'
  resources :tests, only: :index do
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
  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true
      end
    end
  end
end
