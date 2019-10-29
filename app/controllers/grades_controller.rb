class GradesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_grade, only: [:show, :edit, :update, :destroy]

  def index
    @grades = Grade.all
  end

  def show
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(value: params[:grade][:value], user_id: params[:grade][:user], container_type: params[:grade][:container_type], container_id: params[:grade][:container_id])
    @grade.date = Date.today
    if @grade.save
      redirect_to grade_path(@grade)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @grade.update(grade_params)
      redirect_to grade_path(@grade)
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
    params.require(:grade).permit(:value, :container_type, :container_id, :user)
  end

  def get_grade
    @grade = Grade.find(params[:id])
  end

end
