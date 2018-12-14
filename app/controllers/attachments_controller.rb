class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  
  def destroy
    Attachment.find(params[:id]).destroy
    redirect_to root_path
  end
end
