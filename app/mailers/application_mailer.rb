class ApplicationMailer < ActionMailer::Base
  default from: Settings['mailer']['default_from']

  layout 'mailer'

  append_view_path Rails.root.join('app', 'views_mailer')
end
