class AddSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.text :session_id,  null: false
      t.longtext :data

      ## Rememberable
      t.datetime :created_at
      t.datetime :updated_at

    end
    add_index :sessions, :session_id,    unique: true
  end
end
