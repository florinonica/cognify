Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => { sessions: "users/sessions", registrations: 'users/registrations' }
  resources :portals do
    resources :categories
    resources :courses do
      resources :course_modules
    end
  end
  resources :categories
  resources :courses do
    resources :course_modules
  end
  resources :users

  get "/temp" => "welcome#temp_index"
end
