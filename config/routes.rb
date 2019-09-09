Rails.application.routes.draw do
	root 'checklists#index'
  resources :checklists
  devise_for :users
end
