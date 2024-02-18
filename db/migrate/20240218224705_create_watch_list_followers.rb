class CreateWatchListFollowers < ActiveRecord::Migration[7.1]
  def change
    create_table :watch_list_followers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :watch_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
