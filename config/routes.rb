Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations:  'users/registrations',
    sessions:       'users/sessions'
  }
  # ログイン済であればルート先をダッシュボードにする
  authenticated do
    root to: 'users/dash_boards#index', as: :dash_boards
  end

  # ログインしていなければルート先をログイン画面にする
  devise_scope :user do
    root 'users/sessions#new'
  end

  namespace :users do
    get '/dash_boards', to: 'dash_boards#index'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
