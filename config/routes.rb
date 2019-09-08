Rails.application.routes.draw do
	root 'checklists#index'
  resources :checklists, only: [:index, :show, :new, :create]
  devise_for :users
end
