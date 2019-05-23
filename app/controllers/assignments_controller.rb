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
    @assingment = Assingment.new(assingment_params)
    params.require(:course).permit(:files => [])
    save_attachments(@assignment, params[:course][:files])

    if @assingment.save
      redirect_to assingments_path
    else
      @assingment.attachments.each do |file|
        file.destroy
      end
      render 'new'
    end
  end

  def edit
  end

  def update
    params.require(:assingment).permit(:files => [])
    save_attachments(@assingment, params[:course][:files])

    if @assingment.update(assingment_params)
      redirect_to assingments_path
    else
      render 'edit'
    end
  end

  def destroy
    @assignment.destroy
    redirect_to :back
  end

  private

  def assignment_params
    params.require(:assignment).permit(:container, :due_date)
  end

  def get_assignment
    @assignment = Assignment.find(params[:id])
  end

end
