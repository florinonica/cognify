class GradesController < ApplicationController
  before_action :authenticate_user!
  #before_action :get_user, only: [:index, :new, :create, :edit, :update]
  #before_action :get_grade:, only: [:show, :edit, :update, :destroy]

  def index
    @grades = Grade.all
  end

  def show
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    @grade.date = Date.today
    if @grade.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @grade.update(grade_params)
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    @grade.destroy
    redirect_to :back
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
