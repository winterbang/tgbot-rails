class TeleNotifyMigration < ActiveRecord::Migration

  def self.up
    create_table :telegram_users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :username
      t.integer  :telegram_id, unique: true
      # t.boolean  :is_admin
      # t.datetime :locked_at

      t.timestamps
    end

    add_index :telegram_users, :telegram_id
  end

  def self.down
    drop_table :telegram_users
  end

end
