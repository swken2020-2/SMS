Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'login', to: 'login#index'
    get 'login/login', to: 'login#index'
    post 'login/login'
    get 'login/logout'
end
