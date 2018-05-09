Rails.application.routes.draw do
  root 'home#index', as: 'home'

  # Routes for planets
  resources :planets, except: %i[create]

  # Routes for grades
  resources :grades

end
