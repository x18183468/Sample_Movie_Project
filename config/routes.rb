Rails.application.routes.draw do

  resources :movies do
     resources:reviews
     resources :directors
  end
  root "movies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
