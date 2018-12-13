class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    @course
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
end
