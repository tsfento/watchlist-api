class CreateJoinTableUserWatchTitleWatchDate < ActiveRecord::Migration[7.1]
  def change
    create_join_table :user_watch_titles, :watch_dates do |t|
      t.index [:user_watch_title_id, :watch_date_id], :unique => true
      t.index [:watch_date_id, :user_watch_title_id], :unique => true
    end
  end
end
