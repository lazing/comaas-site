#
class Wp::TermRelationship < ApplicationRecord
  include DatabaseWordpress
  belongs_to :post, foreign_key: :object_id
  belongs_to :term_taxonomy

  def oid
    read_attribute :object_id
  end

  def oid=(val)
    write_atrribute :object_id, val
  end

  # restore ruby's default #object_id implementation
  def object_id
    super
  end
end
