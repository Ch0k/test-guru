class ContactMailer < ApplicationMailer
  def contact_me(contact, admin)
    @name = contact.name
    @email = contact.email
    @phone = contact.phone
    @text = contact.text
    puts admin.email
    mail(to: admin.email)
  end
end
