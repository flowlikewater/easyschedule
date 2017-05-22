Rails.application.routes.draw do

  resources :bookings

  root :to => 'welcome#index'

  get '/nesthost_redirect', to:'welcome#nesthost'

  namespace :api, defaults: {format: :json  } do
    devise_for :users
    namespace :v1 do
      resources :users, :only => [ :show, :create, :update, :destroy ]
    end
  end

end
