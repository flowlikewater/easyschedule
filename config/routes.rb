Rails.application.routes.draw do

  root :to => 'main#index'

  devise_for :users

  namespace :api, defaults: {format: :json  } do
    namespace :v1 do
      resources :users, :only => [ :show, :create ]
    end
  end

end
