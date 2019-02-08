# class SubdomainPresent
#   def self.matches?(request)
#     if Rails.env == "production"
#         request.subdomain.present?
#     elsif Rails.env == "staging"
#       request.subdomain.present?
#     else
#       request.subdomain.gsub!(".demo-alokrawat050","").present?
#       end
#   end
# end
#
# class SubdomainBlank
#   def self.matches?(request)
#     if Rails.env == "production"
#         request.subdomain.blank?
#     elsif Rails.env == "staging"
#       request.subdomain.blank?
#     else
#       request.subdomain.gsub!(".demo-alokrawat050","").blank?
#       end
#   end
# end

class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  constraints(SubdomainBlank) do
    root 'welcome#index'
    devise_for :users, :controllers => { sessions: "users/sessions", registrations: 'users/registrations' }
  end

  constraints(SubdomainPresent) do
    root 'welcome#index'
    devise_for :users, :controllers => { sessions: "users/sessions", registrations: "users/registrations"}
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
    resources :ui
  end
  # root 'welcome#index'
  # devise_for :users, :controllers => { sessions: "users/sessions", registrations: 'users/registrations' }
  # resources :portals do
  #   resources :categories
  #   resources :courses do
  #     resources :course_modules
  #   end
  # end
  # resources :categories
  # resources :courses do
  #   resources :course_modules
  # end
  # resources :users
  #
  # get "/temp" => "welcome#temp_index"
end
#
