class AddRatingToUserWatchTitles < ActiveRecord::Migration[7.1]
  def change
    add_column :user_watch_titles, :rating, :boolean, null: true
  end
end
