Rails.application.routes.draw do

  # Mounts
  # ----------------------------------------------------------------------------
  get '/console', to: 'application#console', constraints: ConsoleConstraint.new
  # ----------------------------------------------------------------------------

  # Setup Root & Admin
  # ----------------------------------------------------------------------------
  root to: 'pages#root'

  get '/admin', to: redirect("/#{I18n.locale}/admin")

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

    # Admin
    # ==========================================================================
    namespace :admin do

      # Pages
      # --------------------------------------------------------------------------
      get '/', to: 'pages#dashboard'
      # --------------------------------------------------------------------------

      # Versions
      # --------------------------------------------------------------------------
      get '/version/:id', to: 'versions#show', as: :version
      # --------------------------------------------------------------------------

      # User
      # --------------------------------------------------------------------------
      get   '/users',              to: 'users#index',    as: :users
      get   '/users/:id',          to: 'users#show',     as: :user
      get   '/users/:id/edit',     to: 'users#edit',     as: :edit_user
      patch '/users/:id/edit',     to: 'users#update',   as: :update_user
      get   '/users/:id/delete',   to: 'users#delete',   as: :delete_user
      get   '/users/:id/login_as', to: 'users#login_as', as: :login_as_user
      # --------------------------------------------------------------------------

    end
    # ==========================================================================

  end
end
