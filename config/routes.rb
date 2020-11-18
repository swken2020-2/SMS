Rails.application.routes.draw do
  root 'main#index'
  get 'subjects/index'
  get 'subject/index'
  
  get 'login', to: 'login#index'
  get 'login/login', to: 'login#index'
  post 'login/login'
  get 'login/logout'
end