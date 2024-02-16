class CreateUserWatchTitles < ActiveRecord::Migration[7.1]
  def change
    create_table :user_watch_titles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :watch_title, null: false, foreign_key: true
      t.boolean :watched, default: false
      t.text :review, null: true

      t.timestamps
    end
  end
end
