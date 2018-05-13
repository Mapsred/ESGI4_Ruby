Rails.application.routes.draw do
  root 'home#index', as: 'home'

  # Routes for planets
  resources :planets

  # Routes for grades
  resources :grades

  # Routes for astronauts
  resources :astronauts

end
