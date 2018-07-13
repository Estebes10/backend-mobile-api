Rails.application.routes.draw do

  post '/checkuser', to: 'users#checkuser'

  post '/register', to: 'users#register'


  # API solo para obtener todas las solicitudes y una en especifico
  resources :requests, only: %I[index show] do

    # APIs para obtener todos los eventos de cada solicitud o un evento en
    # especifico
    resources :events, only: %I[index show] do

      resources :situations, only: %I[index show]
    end
  end

end
