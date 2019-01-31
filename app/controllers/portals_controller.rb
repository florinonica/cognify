class PortalsController < ApplicationController
  before_action :get_portal, only: [:show, :edit, :update, :destroy]

  def index
    @portals = Portal.all
  end

  def new
    @portal = Portal.new
  end

  def create
    @portal = Portal.new(portal_params.slice(:name, :subdomain))

    if @portal.save
      @user = User.new(portal_params.slice(:first_name, :last_name, :username, :nickname, :address, :email, :password, :password_confirmation, :type))
      @user.portal = @portal

      if @user.save
        redirect_to temp_path

      else
        @portal.destroy
        render 'new'
      end

    else
      render 'new'
    end
  end

  def edit

    if @portal.update(portal_params)
      redirect_to portal_path
    else
      render 'edit'
    end
  end

  def update
  end

  def destroy
    @portal.destroy
    redirect_to root_path
  end

  private

    def portal_params
      params.require(:portal).permit(:name, :subdomain, :first_name, :last_name, :username, :nickname, :address, :email, :password, :password_confirmation, :type)
    end

    def get_portal
      @portal = Portal.find(params[:id])
    end
end
