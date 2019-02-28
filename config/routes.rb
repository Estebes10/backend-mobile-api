Rails.application.routes.draw do

  post '/checkuser', to: 'users#checkuser'

  post '/register', to: 'users#register'

  post '/getuser', to: 'users#getuser'

  get '/requests/:code', to: 'requests#show'

  get '/requests', to: 'requests#index'

  get '/requests/:code/events', to: 'events#index'

  get '/requests/:code/events/:event_code', to: 'events#show'

  get '/requests/:code/events/:event_code/situations', to: 'situations#index'

  get '/requests/:code/events/:event_code/situations/:id', to: 'situations#show'
=begin
  # API solo para obtener todas las solicitudes y una en especifico
  resources :requests, only: %I[index] do

    get '/events/:code', to: 'events#show'
    # APIs para obtener todos los eventos de cada solicitud o un evento en
    # especifico
    resources :events, only: %I[index] do

      resources :situations, only: %I[index show]
    end

  end
=end
  post '/reportes', to: "reportes#create"

  get '/reportes/:id', to: "reportes#show"

end
