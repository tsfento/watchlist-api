class AddUniqueIndexToWatchListsTitles < ActiveRecord::Migration[7.1]
  def change
    remove_index :watch_lists_titles, ["watch_list_id", "watch_title_id"]
    remove_index :watch_lists_titles, ["watch_title_id", "watch_list_id"]
  end
end
