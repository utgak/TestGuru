Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}, controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start, to: "tests#start"
    end
  end

  resources :badges, only: :index

  resources :test_passages, only: %i[show update] do
    resources :gist, param: :test_passage_id, only: :create
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gist, only: :index
    resources :badges
  end
end
