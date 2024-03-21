class AddUniqueIndexToWatchListsTitlesPartTwo < ActiveRecord::Migration[7.1]
  def change
    add_index :watch_lists_titles, ["watch_list_id", "watch_title_id"], unique: true
    add_index :watch_lists_titles, ["watch_title_id", "watch_list_id"], unique: true
  end
end
