class Contact < ApplicationRecord
  validates_presence_of :full_name, :position, :email, :company
  validates_uniqueness_of :email
  belongs_to :company
end
