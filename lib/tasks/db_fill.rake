namespace :db do
  desc 'Fill tables with demo data'
  task :fill => :environment do

    I18n.locale = 'en'

  end
end
