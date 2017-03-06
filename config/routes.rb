Rails.application.routes.draw do
  resources :websites, except: [:show]
  get 'website/:id', to: 'websites#show', as: 'website_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do 
  	member do
  		get :toggle_status
  	end
  end
  
  root to: 'pages#home'
end
