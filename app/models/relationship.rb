class Relationship < ApplicationRecord
  belongs_to :contact
  belongs_to :relation, class_name: 'Contact'

  validates :contact_id, :relation_id, presence: true
end
