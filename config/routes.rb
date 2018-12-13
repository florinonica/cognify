Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  get "/temp" => "welcome#temp_index"
  #resources :users
  resources :categories
  resources :courses
end
