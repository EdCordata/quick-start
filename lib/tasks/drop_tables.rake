namespace :db do

  desc 'Droping all tables'
  task :drop_tables => :environment do
    conn   = ActiveRecord::Base.connection
    tables = conn.tables
    tables.each do |table|
      puts "Deleting #{table}"
      conn.drop_table(table)
    end
  end

end
