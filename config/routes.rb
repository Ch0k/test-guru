Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  resources :gists
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
      post :gist
    end
  end
  namespace :admin do
    root 'admin/tests#index'
    resources :gists, only: %i[index show]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true
      end
    end
  end
end
