Rails.application.routes.draw do
  devise_for :users
  resources :reports
  root 'home#index', as: 'home'

  # Routes for planets
  resources :planets

  # Routes for grades
  resources :grades

  # Routes for astronauts
  resources :astronauts

  # Routes for expeditions
  resources :expeditions
end
