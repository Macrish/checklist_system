Rails.application.routes.draw do
	root 'checklists#index'
  get 'checklists/index'
  devise_for :users
end
