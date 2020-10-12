namespace :db do
  desc 'Fill tables with demo data'
  task :fill => :environment do

    I18n.locale = 'en'

    puts 'Adding users'
    # ----------------------------------------------
    (1..100).to_a.each do |id|
      User
        .where(id: id)
        .first_or_create(
          id:       id,
          email:    "#{id}@example.com",
          password: 'qwerty123'
        )
    end
    # ----------------------------------------------

  end
end
