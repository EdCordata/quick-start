class CreateVersions < ActiveRecord::Migration[5.1]

  def change
    create_table :versions do |t|
      t.string   :event,          null:  false
      t.string   :model,          null:  false
      t.integer  :model_id,       null:  false
      t.integer  :editor_id,      null:  true
      t.text     :fields_changed, limit: 4294967295
      t.text     :body,           limit: 4294967295
      t.datetime :created_at
    end
  end

end
