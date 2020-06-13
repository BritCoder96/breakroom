Rails.application.routes.draw do
    devise_for :users, :controllers => {:registrations => "registrations"}
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :dashboard
    resources :conversations
    resources :messages
    resources :topics
    resources :admin

    root 'conversations#index'

    get 'conversations_controller/index'
    get '/users', to: 'conversations#index'

    match 'users/:id' => 'users#edit', :via => :update, :as => :admin_update_user
    match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

    authenticate :user do
        mount ActionCable.server => '/cable'
    end
end
