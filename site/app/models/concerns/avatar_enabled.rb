module AvatarEnabled
  extend ActiveSupport::Concern

  included do
    mount_uploader :avatar, AvatarUploader
  end
end
