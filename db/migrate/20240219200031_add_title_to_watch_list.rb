class AddTitleToWatchList < ActiveRecord::Migration[7.1]
  def change
    add_column :watch_lists, :title, :string
  end
end
