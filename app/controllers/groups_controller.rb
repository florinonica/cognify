class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_portal
  before_action :get_course, only: [:index, :new, :create, :edit, :update]
  before_action :get_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = @course.groups.paginate(:page => params[:page], per_page:5)
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = @course.groups.new(group_params)
    if current_user.can_create_course?
      @group.teacher = @course.teachers.first
    else
      @group.teacher = current_user
    end
    if @group.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @group.update(group_params)
      redirect_to group_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    @group.destroy
    redirect_to courses_path
  end

  private

  def get_course
    @course = Course.find(params[:course_id])
  end

  def get_group
    @group = Group.find(params[:id])
  end

  def get_portal
    @portal = Portal.find_by(subdomain: request.subdomain)
  end

  def group_params
    params.require(:group).permit(:groupname, :limit, :course_id, :is_public)
  end
end
