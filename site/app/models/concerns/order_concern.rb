module OrderConcern
  extend ActiveSupport::Concern

  def to_param
    number
  end

  def cid
    @cid ||= begin
      s = number.to_s.try(:gsub, /\-/,'')
      s[0..16]+SecureRandom.hex(2)
    end
  end
end
