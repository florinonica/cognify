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
    !request.subdomain.present?
  end
end

Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: "users/sessions", registrations: "users/registrations"}
  get "/temp" => "welcome#temp_index", as: :temp

  constraints(SubdomainBlank) do
    root 'welcome#index'

    resources :portals
    resources :users
  end

  constraints(SubdomainPresent) do
    root 'welcome#index'

    resources :portals
    resources :categories
    resources :courses do
      resources :groups
      resources :course_modules do
        resources :assignments
      end
      resources :assignments
    end
    resources :users
    resources :assignments
    resources :grades
    resources :groups
    resources :attachments
    resources :enrollments

    get 'courses/:id/add_enrollment' => 'courses#enroll', as: :add_enrollment

    get 'courses/:id/students' => 'courses#students', as: :course_students

    patch 'courses/:id/add_teacher' => 'courses#add_teacher'

    post 'create_user' => 'users#create', as: :create_user

    get 'courses/:id/grade_student' => 'courses#grade_student'
  end
end
