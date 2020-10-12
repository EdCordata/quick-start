class ApplicationController < ActionController::Base
  include SetupConsole
  include SetupLocale
  include SetupAdmin
  include SetupGon
end
