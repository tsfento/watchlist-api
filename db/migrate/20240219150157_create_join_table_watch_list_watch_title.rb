class CreateJoinTableWatchListWatchTitle < ActiveRecord::Migration[7.1]
  def change
    create_join_table :watch_lists, :watch_titles do |t|
      t.index [:watch_list_id, :watch_title_id]
      t.index [:watch_title_id, :watch_list_id]
    end
  end
end
