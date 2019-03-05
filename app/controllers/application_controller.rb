class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  #before_action :get_portal
  before_action :check_subdomain

  layout "application"

  def after_sign_in_path_for(resource)
    root_url(:subdomain => current_user.portal.subdomain)
    #portals_path(Portal.where(subdomain: request.subdomain))
  end

  def save_attachments(container, files)

  	unless files.nil?
  	  files.each do |file|
  	    @attachment = container.attachments.new(user_id: current_user.id, file: file)

  	    if @attachment.save
  	      container.attachments << @attachment
  	    end
  	  end
  	end
  end

  private
    def get_portal

      portals = Portal.where(subdomain: request.subdomain)

      if portals.count > 0
        @portal = portals.first
      else
        redirect_to root_path
      end
    end

    def check_subdomain

      if current_user.present?

        unless request.subdomain == current_user.portal.subdomain
          redirect_to root_url(:subdomain => current_user.portal.subdomain), alert: "You are not authorized to access that subdomain."
        end

      end
    end
end
