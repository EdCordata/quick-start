# Change 'ar_internal_metadata.key' in db. Since we trust RAILS_ENV variable
unless Rails.env.production?
  begin
    sql = "UPDATE ar_internal_metadata SET value = '#{Rails.env.to_s}' WHERE ar_internal_metadata.key = 'environment';"
    ActiveRecord::Base.connection.execute(sql)
  rescue
  end
end
