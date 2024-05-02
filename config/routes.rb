Rails.application.routes.draw do
  root 'static_pages#top'
  devise_for :users, controllers: {passwords: 'users/passwords', registrations: 'users/registrations'}      
  namespace :users do
    get 'dash_boards/index'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
