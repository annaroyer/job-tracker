class ContactsController < ApplicationController
  def new
    @contact = Contact.find(params[:id])
  end
end
