class ContactsController < ApplicationController
  before_action :set_company, only: [:create]

  def create
    @contact = @company.contacts.new(contact_params)
    @contact.save
    redirect_to company_path(@company)
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end
end
