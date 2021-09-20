class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @admins = Admin.all
    if @contact.save
      @admins.each do |admin|
        ContactMailer.contact_me(@contact, admin).deliver_now
      end
      redirect_to root_path, notice: "Contact was successfully created."
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :text)
  end
end
