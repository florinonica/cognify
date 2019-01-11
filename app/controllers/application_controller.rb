class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :get_portal
  layout "application"


  def after_sign_in_path_for(resource)
    temp_path
  end

  def after_sign_up_path_for(resource)
    temp_path
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
        @blog = blogs.first
      else
        redirect_to root_path
      end
    end
end
