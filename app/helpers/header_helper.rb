module HeaderHelper

  def header_active_item(item)
    c  = controller_name
    a  = action_name
    ca = (c + '#' + a)

    css = ''

    case item

      when :root
        css = 'active' if ca == 'pages#root'

      when :sign_up
        css = 'active' if c == 'registrations' && %w[new create].include?(a)

      when :sign_in
        css = 'active' if c == 'sessions' && %w[new create].include?(a)

    end

    css
  end

end
