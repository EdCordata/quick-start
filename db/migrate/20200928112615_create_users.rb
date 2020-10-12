class CreateUsers < ActiveRecord::Migration[6.0]

  def change
    create_table :users do |t|
      t.string :hash_id, null: false, limit: 36

      # Required
      t.string :email,              null: true, default: nil, limit: 320
      t.string :encrypted_password, null: true, default: nil

      # States
      t.string  :role,    null: false, default: 'user'
      t.string  :locale,  null: false, default: 'en'

      # Deleted
      t.boolean :deleted, null: false, default: false

      # Blocked
      t.boolean :blocked,        null: false, default: false
      t.string  :blocked_reason, null: true,  default: nil

      t.timestamps null: false
    end
  end

end
