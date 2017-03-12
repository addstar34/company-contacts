class Relationship < ApplicationRecord
  belongs_to :contact
  belongs_to :relation, class_name: 'Contact'

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  validates :contact_id, :relation_id, presence: true

  def create_inverse
    self.class.create(inverse_relation_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_relation_options)
  end

  def inverses
    self.class.where(inverse_relation_options)
  end

  def inverse_relation_options
    { relation_id: contact_id, contact_id: relation_id }
  end

end
