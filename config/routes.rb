Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  config = Rails.application.config.baukis
#  constraints host: 'baukis-u.example.com' do
#  namespace :staff, path: '' do
  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
#  namespace :staff do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
  	  post 'session' => 'sessions#create', as: :session
  	  delete 'session' => 'sessions#destroy'
      resource :account, except: [ :new, :create, :destroy ]
      resource :password, only: [ :show, :edit, :update ]
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
#  namespace :admin do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
#      post 'session' => 'sessions#create', as: :session
#      delete 'session' => 'sessions#destroy'
      resource :session, only: [ :create, :destroy ]
      resources :staff_members do
        resources :staff_events, only: [ :index]
      end
      resources :staff_events, only: [ :index]
#      resources :staff_members
#      get 'staff_members' => 'staff_members#index'
#      get 'staff_members/new' => 'staff_members#new', as: :admin_staff_members
    end
  end

  namespace :customer do
    root 'top#index'
  end

  root 'errors#not_found'
    get '*anything' => 'errors#not_found'
end
