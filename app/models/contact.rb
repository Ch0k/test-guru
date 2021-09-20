class Contact < ApplicationRecord
  validates :name, :phone, :email, :text, presence: true
end
