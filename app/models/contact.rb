class Contact < ApplicationRecord
  belongs_to :company
  has_many :relationships
  has_many :relations, through: :relationships, dependent: :destroy
  has_many :inverse_relationships, class_name: 'Relationship', foreign_key: 'relation_id'
  has_many :inverse_relations, through: :inverse_relationships, source: :contact, dependent: :destroy

  validates :first_name, :surname, presence: true
end
