class JobsController < ApplicationController
  before_action :set_company, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_company_job, only: [:edit, :update]

  def index
    if params[:sort] == "location"
      @jobs = Job.all.sort_by_location
    elsif params[:sort] == "interest"
      @jobs = Job.all.sort_by_interest
    elsif params[:location]
      @jobs = Job.where(city: params[:location])
    else
      @jobs = Job.all
    end
  end

  def show
    @comment = Comment.new()
    @job = Job.find(params[:id])
    @comments = @job.comments
  end

  def new
    @categories = Category.all
    @job = @company.jobs.new
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_path(@company)
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @job.update(job_params)
      redirect_to company_path(@company)
    end
  end

  def destroy
    Job.destroy(params[:id])

    redirect_to company_path(@company)
  end

  private

  def set_company_job
    @job = @company.jobs.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
