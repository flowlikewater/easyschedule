Rails.application.routes.draw do

  resources :bookings

  root :to => 'welcome#index'

  get '/nesthost_redirect', to:'welcome#nesthost'

  namespace :api, defaults: {format: :json  } do
    namespace :v1 do
      resources :bookings, :only => [ :index, :show ]
    end
  end

end
