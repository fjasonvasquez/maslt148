Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :websites, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'websites#angular'
  get 'website/:id', to: 'websites#show', as: 'website_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'food-news', to: 'pages#food_news'

  resources :blogs do 
  	member do
  		get :toggle_status
  	end
  end
  
  root to: 'pages#home'
end
