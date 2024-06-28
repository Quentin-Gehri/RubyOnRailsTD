Rails.application.routes.draw do
  root "clients#index"

  resources :clients do 
    resources :reparations
  end
end
