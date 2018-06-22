Rails.application.routes.draw do

  resources :requests, only: %I[index show]

end
