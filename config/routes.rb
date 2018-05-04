Rails.application.routes.draw do
  root 'home#index'
  # planets :pokemon, only: %i[index show]

  resources :planets do
    # member do
    #   get :index
    # end
  end

end
