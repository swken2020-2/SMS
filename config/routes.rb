Rails.application.routes.draw do
  get 'subjects/index'
  get 'subject/index'
  root 'main#index'
end