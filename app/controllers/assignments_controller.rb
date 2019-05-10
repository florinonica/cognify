class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assignments = Assignment.all
  end

  def show
  end

  def new
    @assingment = Assignment.new
  end

  def create
  end

  def edit
  end

  def update

  def destroy
  end

  private

  def assignment_params
  end
end
