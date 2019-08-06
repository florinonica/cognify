class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :get_portal, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @users = @portal.users.paginate(:page => params[:page], per_page:10)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.portal = @portal
    save_metadata(@user, @portal)
    if @user.save
      if current_user
        redirect_to root_path
      else
        redirect_to users_path
      end
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :type)
    end

    def get_user
      @user = User.find(params[:id])
    end

    def get_portal
      @portal = Portal.find_by(subdomain: request.subdomain)
    end
end
