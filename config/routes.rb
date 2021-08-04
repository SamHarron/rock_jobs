Rails.application.routes.draw do

  root 'sessions#new'

  get '/signup', to: 'employees#new'
  post '/signup', to: 'employees#create'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	
  delete '/logout', to: 'sessions#logout', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :employees, only: [:new, :create, :show, :update, :edit] do
    resources :locations, only: [:new, :index]
  end

  resources :locations, except: [:index] do
    resources :measurements
  end

  get '/auth/:provider/callback', to: 'sessions#google'
end

