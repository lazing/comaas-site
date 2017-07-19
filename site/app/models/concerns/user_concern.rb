module UserConcern
  extend ActiveSupport::Concern

  included do
    attr_accessor :verify_code
    validates :verify_code, presence: true, if: :mobile_changed?
    validate :verify_code, :validate_mobile, if: :mobile_changed?
  end

  def validate_mobile
    return if mobile.blank?
    v = VerificationCode.new mobile
    return if v.verify verify_code
    errors.add :verify_code, :invalid
  end
end
