Rails.application.routes.draw do
  devise_for :users
  root 'home#index', as: 'home'
  root 'home#credit', as: 'credit'
  root 'home#partner', as: 'partner'
  root 'home#condition', as: 'condition'

  # Routes for planets
  resources :planets

  # Routes for grades
  resources :grades

  # Routes for astronauts
  resources :astronauts

  # Routes for expeditions
  resources :expeditions

  # Routes for reports
  resources :reports

  # Routes for reports
  resources :partner

  # Routes for reports
  resources :condition

  # Routes for reports
  resources :credit

end
