class CreateWatchLists < ActiveRecord::Migration[7.1]
  def change
    create_table :watch_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :private, null: false, default: false

      t.timestamps
    end
  end
end
