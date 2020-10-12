module SetupGon
  extend ActiveSupport::Concern

  included do
    before_action :set_gon
  end

  protected

  def set_gon

    # Locales
    # ------------------------------------------------------------
    gon.locales                = {}
    gon.locales[:current]      = I18n.locale.to_s
    gon.locales[:default]      = Settings['locales']['default']
    gon.locales[:available]    = Settings['locales']['available']
    gon.locales[:translations] = I18n.t('js.plugins').as_json
    # ------------------------------------------------------------

    # DateTime formats
    # ------------------------------------------------------------
    gon.datetime                              = {}
    gon.datetime[:formats]                    = {}
    gon.datetime[:formats][:time]             = DATETIME_FORMATS[:datetime_picker][:time]
    gon.datetime[:formats][:date]             = DATETIME_FORMATS[:datetime_picker][:date]
    gon.datetime[:formats][:datetime]         = DATETIME_FORMATS[:datetime_picker][:datetime]
    gon.datetime[:formats][:parse_date]       = DATETIME_FORMATS[:js][:date]
    gon.datetime[:formats][:parse_date_short] = DATETIME_FORMATS[:js][:date_short]
    gon.datetime[:formats][:parse_date_input] = DATETIME_FORMATS[:js][:date_input]
    # ------------------------------------------------------------

  end

end
