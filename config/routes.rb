Rails.application.routes.draw do
<<<<<<< HEAD
  get 'subjects/index'
  get 'subject/index'
  root 'main#index'
end
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'login', to: 'login#index'
    get 'login/login', to: 'login#index'
    post 'login/login'
    get 'login/logout'
end
>>>>>>> 624472f196be0e7e0a865b6fb29ed93593eba198
