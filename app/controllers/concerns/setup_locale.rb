module SetupLocale
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end

  protected

  def set_locale
    locale = params[:locale] || cookies[:current_locale] || current_user.try(:locale)

    locale = I18n.default_locale unless I18n.available_locales.include?(locale.to_s.to_sym)

    params[:locale] = cookies[:current_locale] = I18n.locale = locale.to_s
  end

end
