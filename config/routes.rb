Rails.application.routes.draw do

  # Mounts
  # ----------------------------------------------------------------------------
  get '/console', to: 'application#console', constraints: ConsoleConstraint.new
  # ----------------------------------------------------------------------------

  # Setup Root
  # ----------------------------------------------------------------------------
  root to: 'pages#root'

  get '/:locale', to: redirect('/')
  # ----------------------------------------------------------------------------

  scope '/:locale', locale: /#{Settings['locales']['visible'].join('|')}/ do

    # User & Session
    # ----------------------------------------------------------------------------
    get  '/sign_up',  to: 'user/registrations#new',    as: :sign_up
    post '/sign_up',  to: 'user/registrations#create', as: :sign_up_post
    get  '/sign_out', to: 'user/sessions#destroy',     as: :sign_out
    get  '/sign_in',  to: 'user/sessions#new',         as: :sign_in
    post '/sign_in',  to: 'user/sessions#create',      as: :sign_in_post
    # ----------------------------------------------------------------------------

  end
end
