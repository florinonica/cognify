class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
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
end
