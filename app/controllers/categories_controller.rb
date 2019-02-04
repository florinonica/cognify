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
    @category = @portal.catetegories.new(category_params)
    if @category.save
      redirect_to portal_categories_path(@portal)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to portal_categories_path(@portal)
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to portal_categories_path(@portal)
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def get_category
      @category = Category.find(params[:id])
    end

    def get_portal
      @portal = Portal.find(params[:portal_id])
    end
end
