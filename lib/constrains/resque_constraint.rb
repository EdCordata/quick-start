class ResqueConstraint

  def matches?(request)
    Rails.env.development?
  end

end
