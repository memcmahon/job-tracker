class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    call_company
    @jobs = @company.jobs
    @contacts = @company.contacts
    @contact = @company.contacts.new()
  end

  def new
    @company = Company.new()
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
    call_company
  end

  def update
    call_company
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    call_company
    @company.destroy
    flash[:success] = "#{company.name} was successfully deleted!"
    redirect_to companies_path
  end


  private

  def call_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
