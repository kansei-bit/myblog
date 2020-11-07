Rails.application.routes.draw do
  root to:'articles#index'
  get 'articles/index'
end
