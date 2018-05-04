Rails.application.routes.draw do
  root 'home#index'
  # resources :pokemon, only: %i[index show]

  # resources :pokemon do
  #   member do
  #     get :index
  #   end
  # end

end
