class Wp::Term < ApplicationRecord
  include DatabaseWordpress
  has_many :term_taxonomy
  has_many :term_relationships, through: :term_taxonomy
  has_many :posts, through: :term_relationships
end
