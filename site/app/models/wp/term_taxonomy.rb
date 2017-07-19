class Wp::TermTaxonomy < ApplicationRecord
  include DatabaseWordpress
  self.primary_key = 'term_taxonomy_id'
  self.table_name = 'wp_term_taxonomy'

  belongs_to :term
  has_many :term_relationships
  has_many :posts, through: :term_relationships

  scope :category, -> { where(taxonomy: :category) }
  scope :post_tag, -> { where(taxonomy: :post_tag) }

  delegate :name, :slug, to: :term\
end
