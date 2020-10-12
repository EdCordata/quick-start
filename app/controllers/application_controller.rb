class ApplicationController < ActionController::Base
  include SetupCurrentUser
  include SetupConsole
  include SetupLocale
  include SetupAdmin
  include SetupGon
end
