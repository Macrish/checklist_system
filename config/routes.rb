Rails.application.routes.draw do
  get 'checklists/index'
  devise_for :users
end
