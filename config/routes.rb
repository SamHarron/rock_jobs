Rails.application.routes.draw do

  get '/signup', to: 'employees#new'
  post '/signup', to: 'employees#create'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	
  delete '/logout', to: 'sessions#logout', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :employees, only: [:new, :create, :show] do
    resources :locations, only: [:new, :create, :index, :show]
  end

  resources :locations do
    resources :measurements, only: [:new, :create, :index]
  end

  resources :measurements

end

