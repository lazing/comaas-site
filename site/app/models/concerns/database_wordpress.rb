module DatabaseWordpress
  extend ActiveSupport::Concern
  included do
    establish_connection "wordpress_#{Rails.env}".to_sym
  end
end
