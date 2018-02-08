class ContactsController < ApplicationController
  def create
    call_company
    @contact = @company.contacts.new(contact_params)
    @contact.save
    redirect_to company_path(@company)
  end

  private

  def call_company
    @company = Company.find(params[:company_id])
  end

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end
end
