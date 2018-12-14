Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => { sessions: "users/sessions", registrations: 'users/registrations' }
  resources :categories
  resources :courses
  resources :users

  get "/temp" => "welcome#temp_index"
end
