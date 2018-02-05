class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company, except: [:show]
  before_action :set_categories, only: [:new, :create, :edit]

  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} job at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @job.update(job_params)
    flash[:success] = "You updated #{@job.title} job at #{@company.name}"
    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @job.destroy
    flash[:success] = "You deleted #{@job.title} job at #{@company.name}"
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_categories
    @categories = Category.all
  end
end
