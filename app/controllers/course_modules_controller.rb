class CourseModulesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_course, only: [:index, :new, :create, :edit, :update]
  before_action :get_course_module, only: [:show, :edit, :update, :destroy]

  def index
    @course_modules = @course.course_modules
  end

  def show
  end

  def new
    @course_module = CourseModule.new
  end

  def create
    @course_module = @course.course_modules.new(course_module_params)
    params.require(:course_module).permit(:files => [])
    save_attachments(@course_module, params[:course_module][:files])
    if @course_module.save
      redirect_to course_course_module_path(@course_module)
    else
      @course_module.attachments.each do |file|
        file.destroy
      end
      render 'new'
    end
  end

  def edit
  end

  def update
    params.require(:course_module).permit(:files => [])
    save_attachments(@course_module, params[:course_module][:files])

    if @course_module.update(course_params)
      redirect_to course_course_module_path(@course_module)
    else
      render 'edit'
    end
  end

  def destroy
    @course = @course_model.course
    @course_module.destroy
    redirect_to course_path(@course)
  end

  private

    def course_module_params
      params.require(:course_module).permit(:title, :description, :course_id)
    end

    def get_course_module
      @course_module = CourseModule.find(params[:id])
    end

    def get_course
      @course = Course.find(params[:course_id])
    end
end
