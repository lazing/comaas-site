#
class Wp::Meta < ApplicationRecord
  include DatabaseWordpress
  self.table_name = 'wp_postmeta'
  belongs_to :post
end
