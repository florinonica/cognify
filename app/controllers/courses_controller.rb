class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_portal, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :get_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = @portal.courses.paginate(:page => params[:page], per_page:6)
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.portal = @portal
    params.require(:course).permit(:files => [])
    save_attachments(@course, params[:course][:files])
    if @course.save
      redirect_to courses_path
    else
      @course.attachments.each do |file|
        file.destroy
      end
      render 'new'
    end
  end

  def edit
  end

  def update
    params.require(:course).permit(:files => [])
    save_attachments(@course, params[:course][:files])

    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

    def course_params
      params.require(:course).permit(:title, :description, :category_id, :price)
    end

    def get_course
      @course = Course.find(params[:id])
    end

    def get_portal
      @portal = Portal.find_by(subdomain: request.subdomain)
    end
end
