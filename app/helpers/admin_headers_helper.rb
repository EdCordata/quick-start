module AdminHeadersHelper

  def admin_header_active_item(item)
    c  = controller_name
    a  = action_name
    ca = (c + '#' + a)

    css = ''

    case item

      when :dashboard
        css = 'true' if ca == 'pages#dashboard'

    end

    css
  end

end
