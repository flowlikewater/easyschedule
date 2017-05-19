Rails.application.routes.draw do

  root :to => 'main#index'

  namespace :api, defaults: {format: :json  } do
    devise_for :users
    namespace :v1 do
      resources :users, :only => [ :show, :create, :update, :destroy ]
    end
  end

end
