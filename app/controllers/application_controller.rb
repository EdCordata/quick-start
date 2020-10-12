class ApplicationController < ActionController::Base
  include SetupCurrentUser
  include SetupConsole
  include SetupLocale
  include SetupGon
end
