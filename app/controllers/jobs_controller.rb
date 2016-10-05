class JobsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @jobs = Job.all
  end
  def new
    @job = Job.new
  end
  def create
    @job = Job.create(job_params)
    redirect_to '/jobs'
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)

    redirect_to '/jobs'
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = 'Job spec deleted successfully'
    redirect_to '/jobs'
  end

  def job_params
    params.require(:job).permit(:title, :company, :location, :description, :salary)
  end
end
