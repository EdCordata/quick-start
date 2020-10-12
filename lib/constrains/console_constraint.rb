class ConsoleConstraint

  def matches?(request)
    Rails.env.development?
  end

end
