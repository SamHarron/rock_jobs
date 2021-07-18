Rails.application.routes.draw do
  resources :employees

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	
  delete '/logout', to: 'sessions#logout', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
