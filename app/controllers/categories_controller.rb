class CategoriesController < ApplicationController
  #before_action :authenticate_user!
  before_action :get_portal, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :get_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = @portal.categories
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.portal = @portal

    if @category.save
      save_metadata(@category, @portal)
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def get_category
      @category = Category.find(params[:id])
    end

    def get_portal
      @portal = Portal.find_by(subdomain: request.subdomain)
    end
end
