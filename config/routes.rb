Rails.application.routes.draw do

  # Mounts
  # ----------------------------------------------------------------------------
  get '/console', to: 'application#console', constraints: ConsoleConstraint.new

  mount ResqueWeb::Engine, at: '/jobs', constraints: ResqueConstraint.new
  # ----------------------------------------------------------------------------

  # Setup Root
  # ----------------------------------------------------------------------------
  root to: 'pages#root'

  get '/:locale', to: redirect('/')
  # ----------------------------------------------------------------------------

  scope '/:locale', locale: /#{Settings['locales']['visible'].join('|')}/ do

  end
end
