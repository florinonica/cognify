class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_portal, only: [:index, :new, :create, :edit, :update, :destroy, :enroll]
  before_action :get_course, only: [:show, :edit, :update, :destroy, :enroll, :add_teacher, :students]

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
      save_metadata(@course, @portal)
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

  def enroll
    @enrollment = Enrollment.new
    @enrollment.course = @course
    @enrollment.student = current_user
    @enrollment.start = Date.today
    @enrollment.end = Date.today + 365
    if @enrollment.save
      redirect_to courses_path
    end
  end

  def add_teacher
    @teacher = Teacher.find(params[:course][:teacher_ids])
    @course.teachers << @teacher
    redirect_to courses_path(@course)
  end

  def students
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
