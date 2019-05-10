class GradesController < ApplicationController
  before_action :authenticate_user!

  def index
    @grades = @user.grades
  end

  def show
  end

  def new
    @grade = Grade.new
  end

  def create
  end

  def edit
  end

  def update

  def destroy
  end

  private

  def grade_params
  end
end
