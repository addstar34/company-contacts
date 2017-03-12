class Contact < ApplicationRecord
  belongs_to :company
  has_many :relationships
  has_many :relations, through: :relationships, dependent: :destroy

  validates :first_name, :surname, presence: true

  def full_name
    "#{first_name} #{surname}"
  end
end
