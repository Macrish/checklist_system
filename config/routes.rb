Rails.application.routes.draw do
	root 'forms#index'
  resources :forms
  devise_for :users
end
