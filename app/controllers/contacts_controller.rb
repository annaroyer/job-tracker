class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    flash[:success] = "Contact #{@contact.full_name} created!" if @contact.save
    redirect_to company_contact_path(@contact.company, @contact)
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)  
  end
end
