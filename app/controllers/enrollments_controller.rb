class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_portal
  before_action :get_enrollment, only: [:show, :edit, :update, :destroy]

  def index
    @enrollments = current_user.enrollments
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.student = current_user
    @enrollment.start = Date.today
    @enrollment.end = Date.today + 365
    if @enrollment.save
      redirect_to courses_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Enrollment.find(params[:id]).destroy
    redirect_to courses_path
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course)
  end

  def get_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def get_portal
    @portal = Portal.find_by(subdomain: request.subdomain)
  end
end
