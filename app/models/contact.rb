class Contact < ApplicationRecord
  belongs_to :company
  validates :first_name, :surname, presence: true
end
