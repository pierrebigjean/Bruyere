class Plant < ApplicationRecord
  has_many :ownerships, dependent: :destroy
  has_many :locations, through: :ownerships

  validates :name, presence: true

  CATEGORY = %w(Intérieures Aromatiques Potager Verger Arbres Fleurs Cactus Bassin Orchidées Palmiers Sauvages Haies)

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :nickname ],
    using: {
      tsearch: { prefix: true }
    }

end
