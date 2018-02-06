class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @contacts = @company.contacts
    @contact = @company.contacts.new()
    @jobs = @company.jobs
  end

  def new
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_jobs_path(@company)
    end
  end

  def show
    @comment = Comment.new()
    @job = Job.find(params[:id])
    @comments = @job.comments
  end

  def edit
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    if @job.update(job_params)
      redirect_to company_jobs_path(@company)
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    Job.destroy(params[:id])

    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
