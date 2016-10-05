Rails.application.routes.draw do
  root "jobs#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'jobs' => 'jobs#index'
  resources :jobs
end
