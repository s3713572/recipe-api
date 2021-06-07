Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes, :defaults => { :format => 'json' }, only: [:index, :show]
      resources :foods, :defaults => { :format => 'json' }, only: [:index, :show]
      resources :purchase_orders, :defaults => { :format => 'json' }
    end
  end

  get 'auth/authorize', to: 'authentication#authorize', :defaults => { :format => 'json' }
  get 'auth/request_new_token', to: 'authentication#request_new_token', :defaults => { :format => 'json' }
  get 'auth/userinfo', to: 'authentication#user_info', :defaults => { :format => 'json' }
  
  get '404', to: 'errors#not_found'
  get '403', to: 'errors#forbidden'
  get '500', to: 'errors#internal_error'

  root to: 'home#index'
end
