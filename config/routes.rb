Rails.application.routes.draw do
  resources :subtasks
  resources :projects do
  	resources :tasks do
  		member do
  			get :split
  		end
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
