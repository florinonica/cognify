class GradesController < ApplicationController
  before_action :authenticate_user!
  #before_action :get_user, only: [:index, :new, :create, :edit, :update]
  #before_action :get_grade:, only: [:show, :edit, :update, :destroy]

  def index
    @grades = @user.grades
  end

  def show
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = @user.grades.new(grade_params)
    @grade.date = Date.today
    if @grade.save
      redirect_to user_grades_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @grade.update(grade_params)
      redirect_to user_grades_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    @grade.destroy
    redirect_to user_grades_path(@user)
  end

  private

  def grade_params
    params.require(:grade).permit(:value, :container, :user)
  end

  def get_grade
    @grade = Grade.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end
end
