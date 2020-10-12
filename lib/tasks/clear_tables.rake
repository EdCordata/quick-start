namespace :db do

  desc 'Clear all tables'
  task :clear => :environment do
    ActiveRecord::Base.connection.tables.each do |model|
      model = model.classify.constantize rescue nil
      if model
        puts "Clearing table: #{model}"
        model.destroy_all
      end
    end
  end

end
