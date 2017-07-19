class Wp::Post < ApplicationRecord
  include DatabaseWordpress
  has_many\
    :term_relationships,
    -> { joins(:term_taxonomy) }, foreign_key: :object_id
  has_many :term_taxonomy, through: :term_relationships
  has_many :terms, through: :term_taxonomy

  has_many\
    :categories, -> { category },
    through: :term_relationships, source: :term_taxonomy

  has_many\
    :post_tags, -> { post_tag },
    through: :term_relationships, source: :term_taxonomy

  has_many\
    :meta,
    foreign_key: 'post_id',
    class_name: 'Wp::Meta'

  belongs_to :parent, foreign_key: 'post_parent', class_name: 'Wp::Post'
  has_many :children, foreign_key: 'post_parent', class_name: 'Wp::Post'

  scope :publish, -> { where(post_status: :publish) }
  scope :type_post, -> { where(post_type: :post) }
  scope :type_page, -> { where(post_type: :page) }
  scope :by_term, ->(slug) { joins(:terms).merge(Wp::Term.where(slug: slug)) }

  alias_attribute :updated_at, :post_modified_gmt

  def thumbnail
    @thumbnail ||= begin
      thumbnail_id =
        meta.where(meta_key: '_thumbnail_id').pluck(:meta_value).first
      Wp::Post.find_by id: thumbnail_id
    end
  end

  def cache_key(*timestamp_names)
    if timestamp_names.any?
      super(*timestamp_names)
    else
      super(:post_modified_gmt)
    end
  end
end
