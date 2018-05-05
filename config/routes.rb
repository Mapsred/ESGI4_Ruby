Rails.application.routes.draw do
  root 'home#index', as: "home"
  # planets :pokemon, only: %i[index show]

  resources :planets do
    # member do
    #   get :index
    # end
  end

  # Routes for grades
  resources :grades

  # resources :grades do
    # get :index, as: "grades_index"
    # get :new, as: "grades_new"
    # get :create, as: "grades_index"
  # end



end
