class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_portal

  private

  def get_group
    @group = Group.find(params[:id])
  end

  def get_portal
    @portal = Portal.find_by(subdomain: request.subdomain)
  end
end
